//
//  CategoryList.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct CategoryList: Codable, Cacheable {
    let categories: [Category]
    let createdAt: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        categories = try container.decode([Category].self)
        createdAt = Date()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(categories)
    }
}
