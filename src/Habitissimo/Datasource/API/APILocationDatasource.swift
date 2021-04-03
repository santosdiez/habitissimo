//
//  APILocationDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct APILocationDatasource {
    let client: LocationRequestsClient
}

extension APILocationDatasource: LocationDatasource {
    func locations(completion: @escaping ([Location]?, Error?) -> Void) {
        client.requestLocations(completion: completion)
    }
}
