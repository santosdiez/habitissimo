//
//  QuoteRequestDatasource.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import Foundation

protocol QuoteRequestDatasource {
    func quoteRequests(completion: @escaping ([QuoteRequest]?, Error?) -> Void)
}
