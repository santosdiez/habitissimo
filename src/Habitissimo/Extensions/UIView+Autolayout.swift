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

    func fitToSuperview(with insets: NSDirectionalEdgeInsets = .zero) {
        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.leading),
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            superview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.trailing),
            superview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
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
