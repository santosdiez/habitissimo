//
//  CoreDataQuoteRequestDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import CoreData
import Foundation

struct CoreDataQuoteRequestDatasource: QuoteRequestDatasource {
    let context: NSManagedObjectContext

    func createQuoteRequest(completion: @escaping (Error?) -> Void) {
        let request = QuoteRequest(context: context)
        request.id = UUID()
        request.name = "Pepe"
        request.email = "pepe@example.com"
        request.jobDescription = "Chapucilla"
        request.locationId = 1
        request.phone = "666334455"
        request.subcategoryId = "33"

        do {
            try context.save()
            completion(nil)
        } catch {
            completion(error)
        }
    }

    func quoteRequests(completion: @escaping ([QuoteRequest]?, Error?) -> Void) {
        let request = NSFetchRequest<QuoteRequest>(entityName: "QuoteRequest")
        do {
            let quoteRequests = try context.fetch(request)
            completion(quoteRequests, nil)
        } catch {
            completion(nil, error)
        }
    }
}
