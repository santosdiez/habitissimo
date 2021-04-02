//
//  RequestsClient.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

class RequestsClient {
    let networkClient: NetworkClient

    enum Endpoint {
        static let categories = "/category/list"
        static let locations = "/location/list"
    }

    private enum Constants {
        static let host = "api.habitissimo.es"
    }

    init() {
        networkClient = NetworkClient(host: Constants.host)
    }
}
