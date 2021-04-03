//
//  QuoteRequestCell.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import UIKit

class QuoteRequestCell: UITableViewCell {
    static let reuseIdentifier = "QuoteRequestCell"

    private let stackView = UIStackView.initForAutolayout()
    private let nameTitleLabel = UILabel.initForAutolayout()
    private let nameLabel = UILabel.initForAutolayout()
    private let phoneTitleLabel = UILabel.initForAutolayout()
    private let phoneLabel = UILabel.initForAutolayout()
    private let emailTitleLabel = UILabel.initForAutolayout()
    private let emailLabel = UILabel.initForAutolayout()
    private let descriptionTitleLabel = UILabel.initForAutolayout()
    private let descriptionLabel = UILabel.initForAutolayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    func setup(with quoteRequest: QuoteRequestViewModel) {
        nameLabel.text = [quoteRequest.name, quoteRequest.subcategoryName].joined(separator: " - ")
        phoneLabel.text = quoteRequest.phoneNumber
    }
}

private extension QuoteRequestCell {
    enum Constants {
        static let margin: CGFloat = 15
        static let borderWidth: CGFloat = 1
    }

    func setupView() {
        addSubviews()
        addConstraints()
        setupSubviews()
    }

    func addSubviews() {
        stackView.addArrangedSubviews([
            nameTitleLabel,
            nameLabel,
            phoneTitleLabel,
            phoneLabel,
            emailTitleLabel,
            emailLabel,
            descriptionTitleLabel,
            descriptionLabel
        ])

        contentView.addSubview(stackView)
    }

    func addConstraints() {
        stackView.fitToSuperview(with: NSDirectionalEdgeInsets(all: Constants.margin))
    }

    func setupSubviews() {
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        [nameTitleLabel,
        phoneTitleLabel,
        emailTitleLabel,
        descriptionTitleLabel].forEach {
            $0.font = UIFont.preferredFont(forTextStyle: .caption1)
            $0.textColor = .lightGray
        }

        nameTitleLabel.text = NSLocalizedString("Name", comment: "")
        phoneTitleLabel.text = NSLocalizedString("Phone", comment: "")
        emailTitleLabel.text = NSLocalizedString("Email", comment: "")
        descriptionTitleLabel.text = NSLocalizedString("Description", comment: "")

        [nameLabel,
        phoneLabel,
        emailLabel,
        descriptionLabel].forEach {
            $0.font = UIFont.preferredFont(forTextStyle: .body)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }

        // Add bottom border
        let border = UIView.initForAutolayout()
        border.backgroundColor = .lightGray
        contentView.addSubview(border)

        NSLayoutConstraint.activate([
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            border.heightAnchor.constraint(equalToConstant: Constants.borderWidth)
        ])
    }
}
