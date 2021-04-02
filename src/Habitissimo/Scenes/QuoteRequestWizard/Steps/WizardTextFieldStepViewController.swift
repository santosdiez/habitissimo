//
//  WizardTextFieldStepViewController.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import UIKit

class WizardTextFieldStepViewController: WizardStepViewController {
    private let textField = UITextField.initForAutolayout()

    override init(for field: WizardField,
                  buttonTitle: String) {
        super.init(for: field, buttonTitle: buttonTitle)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

private extension WizardTextFieldStepViewController {
    func setupView() {
        addSubviews()
        addConstraints()
        setupSubviews()
    }

    func addSubviews() {
        containerView.addSubview(textField)
    }

    func addConstraints() {
        textField.fitToSuperview()
    }

    func setupSubviews() {
        textField.placeholder = wizardField?.placeholder
    }
}
