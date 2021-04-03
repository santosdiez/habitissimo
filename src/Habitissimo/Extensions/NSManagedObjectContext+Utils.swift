//
//  NSManagedObjectContext+Utils.swift
//  Habitissimo
//
//  Created by Borja on 3/4/21.
//

import CoreData
import Foundation

extension NSManagedObjectContext {
    func saveIfNeeded() {
        if hasChanges {
            do {
                try save()
            } catch {
                let nserror = error as NSError
                assertionFailure("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
