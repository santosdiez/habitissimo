//
//  SubcategoryList.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct SubcategoryList: Codable, Cacheable {
    let subcategories: [Subcategory]
    let createdAt: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        subcategories = try container.decode([Subcategory].self)
        createdAt = Date()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(subcategories)
    }
}
