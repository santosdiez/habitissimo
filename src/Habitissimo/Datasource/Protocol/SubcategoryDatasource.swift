//
//  SubcategoryDatasource.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol SubcategoryDatasource {
    func subcategories(for categoryId: String, completion: @escaping ([Subcategory]?, Error?) -> Void)
}
