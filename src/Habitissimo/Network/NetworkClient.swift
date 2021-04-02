//
//  NetworkClient.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

enum NetworkError: Error {
    case malformedRequest
    case genericError

    var localizedDescription: String {
        switch self {
        case .malformedRequest:
            return NSLocalizedString("Malformed network request", comment: "")
        case .genericError:
            return NSLocalizedString("Unknown network error", comment: "")
        }
    }
}

class NetworkClient {
    private let urlSession = URLSession(configuration: .default)
    private let cache = Cache<String, Cacheable>()
    private let decoder = JSONDecoder()
    private let host: String

    private enum Constants {
        static let scheme = "https"
    }

    init(host: String) {
        self.host = host
    }

    func request<T: Codable & Cacheable>(path: String,
                                         queryItems: [URLQueryItem]? = nil,
                                         completion: @escaping ((T?, Error?) -> Void)) {
        guard let urlRequest = createRequest(path: path, queryItems: queryItems),
              let cacheKey = urlRequest.url?.absoluteString else {
            performOnMainQueue {
                completion(nil, NetworkError.malformedRequest)
            }
            return
        }

        if let cached = cache.object(forKey: cacheKey) as? T, cached.isValid {
            completion(cached, nil)
            NSLog("Returning cached item")
            return
        }

        let dataTask = urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                self.performOnMainQueue {
                    completion(nil, error)
                }
                return
            }

            if let response = response as? HTTPURLResponse,
               response.statusCode == 200,
               let data = data {
                let obj = try? self.decoder.decode(T.self, from: data)
                // Cache response
                self.cache.setObject(obj, forKey: cacheKey)
                self.performOnMainQueue {
                    completion(obj, nil)
                }
            } else {
                self.performOnMainQueue {
                    completion(nil, NetworkError.genericError)
                }
            }
        }

        dataTask.resume()
    }
}

private extension NetworkClient {
    func createRequest(path: String, queryItems: [URLQueryItem]?) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else { return nil }

        return URLRequest(url: url)
    }

    func performOnMainQueue(block: @escaping () -> Void) {
        DispatchQueue.main.async {
            block()
        }
    }
}
