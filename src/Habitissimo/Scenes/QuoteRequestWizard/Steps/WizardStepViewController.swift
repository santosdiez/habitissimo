//
//  WizardStepViewController.swift
//  Habitissimo
//
//  Created by Borja on 2/4/21.
//

import UIKit

protocol WizardStepViewControllerDelegate: AnyObject {
    func didTapButton(for field: WizardField)
}

class WizardStepViewController: UIViewController {
    private let titleLabel = UILabel.initForAutolayout()
    private let button = UIButton.initForAutolayout(type: .custom)
    private let errorLabel = UILabel.initForAutolayout()
    private let buttonTitle: String
    private weak var delegate: WizardStepViewControllerDelegate?

    let wizardField: WizardField?
    let containerView = UIView.initForAutolayout()

    init(for field: WizardField,
         buttonTitle: String,
         delegate: WizardStepViewControllerDelegate? = nil) {
        wizardField = field
        self.buttonTitle = buttonTitle
        self.delegate = delegate
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
        static let titleTopMargin: CGFloat = 100
        static let titleHorizontalMargin: CGFloat = 30
        static let errorLabelTopMargin: CGFloat = 10
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
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)

        titleLabel.text = wizardField?.title

        errorLabel.numberOfLines = 0
        errorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        errorLabel.textColor = .red

        button.layer.cornerRadius = Constants.buttonRadius
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitleColor(.systemGray, for: .disabled)
        button.backgroundColor = Asset.Colors.hOrange.color
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
    }

    @objc func tapped(sender: UIButton) {
        guard let field = wizardField else { return }
        delegate?.didTapButton(for: field)
    }
}
