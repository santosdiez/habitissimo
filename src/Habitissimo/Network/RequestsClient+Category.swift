//
//  NetworkClient+Category.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol CategoryRequestsClient {
    func requestCategoryList(completion: @escaping ([Category]?, Error?) -> Void)
}

extension RequestsClient: CategoryRequestsClient {
    func requestCategoryList(completion: @escaping ([Category]?, Error?) -> Void) {
        networkClient.request(path: Endpoint.categories) { (categoryList: CategoryList?, error: Error?) in
            completion(categoryList?.categories, error)
        }
    }
}
