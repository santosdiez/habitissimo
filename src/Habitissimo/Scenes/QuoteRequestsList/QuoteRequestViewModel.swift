//
//  QuoteRequestViewModel.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

struct QuoteRequestViewModel: Hashable {
    let id: UUID
    let name: String
    let subcategoryName: String
    let phoneNumber: String
    let locationName: String
    let jobDescription: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: QuoteRequestViewModel, rhs: QuoteRequestViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
