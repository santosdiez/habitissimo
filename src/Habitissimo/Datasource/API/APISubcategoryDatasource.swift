//
//  APISubcategoryDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct APISubcategoryDatasource: SubcategoryDatasource {
    private let client: SubcategoryRequestsClient

    init(client: SubcategoryRequestsClient) {
        self.client = client
    }
}
