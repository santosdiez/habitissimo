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

    static func from(_ model: QuoteRequest) -> QuoteRequestViewModel? {
        guard let id = model.id,
              let name = model.name,
              let phoneNumber = model.phone,
              let jobDescription = model.jobDescription else { return nil }

        return QuoteRequestViewModel(id: id,
                                     name: name,
                                     subcategoryName: "",
                                     phoneNumber: phoneNumber,
                                     locationName: "",
                                     jobDescription: jobDescription)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: QuoteRequestViewModel, rhs: QuoteRequestViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
