//
//  APISubcategoryDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct APISubcategoryDatasource {
    let client: SubcategoryRequestsClient
}

extension APISubcategoryDatasource: SubcategoryDatasource {
    func subcategories(for categoryId: String, completion: @escaping ([Subcategory]?, Error?) -> Void) {
        // TODO
    }
}
