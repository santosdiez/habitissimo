//
//  CategoryDatasource.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

struct APICategoryDatasource {
    let client: CategoryRequestsClient
}

extension APICategoryDatasource: CategoryDatasource {
    func categories(completion: @escaping ([Category]?, Error?) -> Void) {
        // TODO
    }
}
