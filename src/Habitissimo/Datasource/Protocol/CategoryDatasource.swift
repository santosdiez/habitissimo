//
//  LocationDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

protocol CategoryDatasource {
    func categories(completion: @escaping ([Category]?, Error?) -> Void)
}
