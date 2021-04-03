//
//  LocationDatasource.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import Foundation

protocol LocationDatasource {
    func locations(completion: @escaping ([Location]?, Error?) -> Void)
}
