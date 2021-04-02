//
//  NetworkClient+Subcategory.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol SubcategoryRequestsClient {
    func requestSubategoryList(parentId: String, completion: @escaping ([Subcategory]?, Error?) -> Void)
}

extension RequestsClient: SubcategoryRequestsClient {
    func requestSubategoryList(parentId: String, completion: @escaping ([Subcategory]?, Error?) -> Void) {
        let path = "\(Endpoint.categories)/\(parentId)"
        networkClient.request(path: path) { (subcategoryList: SubcategoryList?, error: Error?) in
            completion(subcategoryList?.subcategories, error)
        }
    }
}
