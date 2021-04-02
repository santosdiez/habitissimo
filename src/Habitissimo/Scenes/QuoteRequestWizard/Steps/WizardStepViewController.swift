//
//  WizardStepViewController.swift
//  Habitissimo
//
//  Created by Borja on 2/4/21.
//

import UIKit

class WizardStepViewController: UIViewController {
    private let titleLabel = UILabel.initForAutolayout()
    private let button = UIButton.initForAutolayout(type: .custom)
    private let errorLabel = UILabel.initForAutolayout()
    private let buttonTitle: String

    let wizardField: WizardField?
    let containerView = UIView.initForAutolayout()

    init(for field: WizardField,
         buttonTitle: String) {
        wizardField = field
        self.buttonTitle = buttonTitle
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    required init?(coder: NSCoder) {
        wizardField = nil
        buttonTitle = ""
        super.init(coder: coder)
        setupView()
    }
}

private extension WizardStepViewController {
    enum Constants {
        static let titleTopMargin: CGFloat = 60
        static let titleHorizontalMargin: CGFloat = 30
        static let titleFontSize: CGFloat = 20
        static let errorLabelTopMargin: CGFloat = 10
        static let errorFontSize: CGFloat = 12
        static let containerViewTopMargin: CGFloat = 10
        static let buttonTopMargin: CGFloat = 50
        static let buttonHeight: CGFloat = 50
        static let buttonRadius: CGFloat = 15
    }

    func setupView() {
        addSubviews()
        addConstraints()
        setupSubviews()
    }

    func addSubviews() {
        view.addSubviews([
            titleLabel,
            containerView,
            errorLabel,
            button
        ])
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.titleTopMargin),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleHorizontalMargin),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Constants.titleHorizontalMargin),
            containerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.containerViewTopMargin),
            errorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            errorLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.errorLabelTopMargin),
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            button.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: Constants.buttonTopMargin),
            button.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }

    func setupSubviews() {
        view.backgroundColor = .systemBackground

        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)

        titleLabel.text = wizardField?.title

        errorLabel.numberOfLines = 0
        errorLabel.font = UIFont.systemFont(ofSize: Constants.errorFontSize)
        errorLabel.textColor = .red

        button.layer.cornerRadius = Constants.buttonRadius
        button.setTitleColor(.label, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.backgroundColor = .lightGray
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
    }

    @objc func tapped(sender: UIButton) {
        // TODO
    }
}
