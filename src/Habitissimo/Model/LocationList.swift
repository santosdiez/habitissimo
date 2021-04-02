//
//  LocationList.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct LocationList: Codable, Cacheable {
    let locations: [Location]
    let createdAt: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        locations = try container.decode([Location].self)
        createdAt = Date()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(locations)
    }
}
