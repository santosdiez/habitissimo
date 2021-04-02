//
//  Cacheable.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol Cacheable {
    var createdAt: Date { get }
}

private let cachingTime: TimeInterval = 10 * 60 // 10 minutes

extension Cacheable {
    var isValid: Bool {
        createdAt.addingTimeInterval(cachingTime) >= Date()
    }
}
