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

    }
}

private extension QuoteRequestCell {
    func setupView() {

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

        addSubview(stackView)
    }

    func addConstraints() {
        stackView.fitToSuperview()
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
            $0.textColor = .systemGray6
        }

        [nameLabel,
        phoneLabel,
        emailLabel,
        descriptionLabel].forEach {
            $0.font = UIFont.preferredFont(forTextStyle: .body)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }
    }
}
