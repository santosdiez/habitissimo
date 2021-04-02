//
//  NetworkClient+Location.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol LocationRequestsClient {
    func requestLocations(completion: @escaping ([Location]?, Error?) -> Void)
}

extension RequestsClient: LocationRequestsClient {
    func requestLocations(completion: @escaping ([Location]?, Error?) -> Void) {
        networkClient.request(path: Endpoint.locations) { (locationList: LocationList?, error: Error?) in
            completion(locationList?.locations, error)
        }
    }
}
