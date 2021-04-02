//
//  Subcategory.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

struct Subcategory: Codable {
    let id: String
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
    }
}
