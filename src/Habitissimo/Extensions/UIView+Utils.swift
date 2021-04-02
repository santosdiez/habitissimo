//
//  UIView+Utils.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
