//
//  NSDirectionalEdgeInsets+Utils.swift
//  Habitissimo
//
//  Created by Borja on 3/4/21.
//

import UIKit

extension NSDirectionalEdgeInsets {
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical,
                  leading: horizontal,
                  bottom: vertical,
                  trailing: horizontal)
    }

    init(all value: CGFloat) {
        self.init(top: value,
                  leading: value,
                  bottom: value,
                  trailing: value)
    }
}
