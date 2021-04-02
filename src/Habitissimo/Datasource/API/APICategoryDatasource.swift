//
//  CategoryDatasource.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

struct APICategoryDatasource: CategoryDatasource {
    private let client: CategoryRequestsClient

    init(client: CategoryRequestsClient) {
        self.client = client
    }
}
