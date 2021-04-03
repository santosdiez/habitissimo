//
//  QuoteRequestWizardViewController.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import UIKit

enum WizardField {
    case name
    case subcategory
    case description
    case location
    case email
    case phone

    var title: String {
        switch self {
        case .name:
            return NSLocalizedString("Please, tell us your name",
                                     comment: "")
        case .subcategory:
            return NSLocalizedString("Now, select the category that best fits what you are looking for",
                                     comment: "")
        case .description:
            return NSLocalizedString("Can you briefly describe the job you need to get done?",
                                     comment: "")
        case .location:
            return NSLocalizedString("Let's narrow down your search by area. You can either use names or ZIP codes",
                                     comment: "")
        case .email:
            return NSLocalizedString("We are almost done.. Please, provide a valid email",
                                     comment: "")
        case .phone:
            return NSLocalizedString("And finally, can you also provide us a phone number?",
                                     comment: "")
        }
    }

    var placeholder: String? {
        switch self {
        case .name:
            return NSLocalizedString("Your name", comment: "")
        case .description:
            return NSLocalizedString("Description", comment: "")
        case .location:
            return NSLocalizedString("State or ZIP code", comment: "")
        case .email:
            return NSLocalizedString("youremail@example.com", comment: "")
        case .phone:
            return NSLocalizedString("Phone number", comment: "")
        default:
            return nil
        }
    }
}

class QuoteRequestWizardViewController: UIPageViewController {
    private let cancelButton = UIButton.initForAutolayout(type: .custom)
    private let titleLabel = UILabel.initForAutolayout()
    private lazy var wizardViewControllers: [UIViewController] = {
        let nextButton = NSLocalizedString("Next", comment: "")
        let saveButton = NSLocalizedString("Save", comment: "")

        return [
            WizardTextFieldStepViewController(for: .name,
                                              buttonTitle: nextButton,
                                              delegate: self),
            WizardTextFieldStepViewController(for: .description,
                                              buttonTitle: nextButton,
                                              delegate: self),
            WizardTextFieldStepViewController(for: .email,
                                              buttonTitle: nextButton,
                                              delegate: self),
            WizardTextFieldStepViewController(for: .phone,
                                              buttonTitle: saveButton,
                                              delegate: self)
        ]
    }()

    init() {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("New quote request", comment: "")
        dataSource = self

        guard let firstViewController = wizardViewControllers.first else { return }

        setViewControllers([firstViewController],
                           direction: .forward,
                           animated: false,
                           completion: nil)
    }
}

extension QuoteRequestWizardViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = wizardViewControllers.firstIndex(of: viewController),
              index + 1 < wizardViewControllers.count else { return nil }

        return wizardViewControllers[index + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = wizardViewControllers.firstIndex(of: viewController),
              index - 1 >= 0 else { return nil }

        return wizardViewControllers[index - 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        wizardViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let viewController = pageViewController.viewControllers?.first else { return 0 }

        return wizardViewControllers.firstIndex(of: viewController) ?? 0
    }
}

extension QuoteRequestWizardViewController: WizardStepViewControllerDelegate {
    func didTapButton(for field: WizardField) {
        guard let currentViewController = self.viewControllers?.first else { return }

        guard let nextViewController = self.dataSource?.pageViewController(self,
                                                                           viewControllerAfter: currentViewController) as? WizardStepViewController else {
            // If there's no next, we reached the last controller. Time to try and save
            return
        }

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setViewControllers([nextViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
    }
}

private extension QuoteRequestWizardViewController {
    enum Constants {
        static let cancelButtonTopMargin: CGFloat = 10
        static let cancelButtonTrailingMargin: CGFloat = 5
        static let cancelButtonSize: CGFloat = 40
        static let titleTopMargin: CGFloat = 40
        static let titleLeadingMargin: CGFloat = 30
        static let titleTrailingMargin: CGFloat = 40
    }

    func setupView() {
        addSubviews()
        addConstraints()
        setupSubviews()
    }

    func addSubviews() {
        view.addSubviews([
            titleLabel,
            cancelButton
        ])
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.titleTopMargin),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleLeadingMargin),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Constants.titleTrailingMargin),
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.cancelButtonTopMargin),
            view.trailingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: Constants.cancelButtonTrailingMargin),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.cancelButtonSize),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.cancelButtonSize)
        ])
    }

    func setupSubviews() {
        view.backgroundColor = .systemBackground

        let pageControlAppearance = UIPageControl.appearance(whenContainedInInstancesOf: [
            QuoteRequestWizardViewController.self
        ])
        pageControlAppearance.pageIndicatorTintColor = .systemGray
        pageControlAppearance.currentPageIndicatorTintColor = .label

        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = NSLocalizedString("New quote request", comment: "")

        cancelButton.tintColor = .label
        cancelButton.contentMode = .scaleAspectFit
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }

    @objc func dismissSelf() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
