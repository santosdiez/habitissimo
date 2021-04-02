//
//  UIView+Autolayout.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import UIKit

extension UIView {
    static func initForAutolayout() -> Self {
        let view = Self.init(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func fitToSuperview() {
        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}

extension UIButton {
    static func initForAutolayout(type: ButtonType) -> UIButton {
        let view = UIButton(type: type)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
