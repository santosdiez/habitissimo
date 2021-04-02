//
//  Location.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let zipCode: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case zipCode = "zip"
        case latitude = "geo_lat"
        case longitude = "geo_lng"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        zipCode = try container.decode(String.self, forKey: .zipCode)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(zipCode, forKey: .zipCode)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}
