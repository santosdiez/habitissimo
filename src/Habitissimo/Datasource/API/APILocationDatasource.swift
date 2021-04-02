//
//  APILocationDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct APILocationDatasource {
    private let client: LocationRequestsClient

    init(client: LocationRequestsClient) {
        self.client = client
    }
}

extension APILocationDatasource: LocationDatasource {
    func requestLocations(completion: @escaping ([Location]?, Error?) -> Void) {
        client.requestLocations(completion: completion)
    }
}
