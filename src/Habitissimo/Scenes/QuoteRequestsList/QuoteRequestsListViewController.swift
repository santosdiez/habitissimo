//
//  ViewController.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import UIKit

class QuoteRequestsListViewController: UITableViewController {
    private enum Section {
        case main
    }

    private var datasource: QuoteRequestDatasource?
    private var quotes: [QuoteRequestViewModel] = [] {
        didSet {
            applySnapshot()
        }
    }
    private lazy var tableDatasource: UITableViewDiffableDataSource<Section, QuoteRequestViewModel> = {
        UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, quote in
            let cell = tableView.dequeueReusableCell(withIdentifier: QuoteRequestCell.reuseIdentifier,
                                                     for: indexPath) as? QuoteRequestCell
            cell?.setup(with: quote)
            return cell
        }
    }()

    init(datasource: QuoteRequestDatasource) {
        super.init(nibName: nil, bundle: nil)
        self.datasource = datasource
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cells
        tableView.register(QuoteRequestCell.self, forCellReuseIdentifier: QuoteRequestCell.reuseIdentifier)

        applySnapshot(animatingDifferences: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadRequests()
    }
}

private extension QuoteRequestsListViewController {
    func setupView() {
        addSubviews()
        addConstraints()
        setupSubviews()
    }

    func addSubviews() {
    }

    func addConstraints() {
    }

    func setupSubviews() {
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(showQuoteWizard))
    }
}

private extension QuoteRequestsListViewController {
    func loadRequests() {
        datasource?.quoteRequests { requests, error in
            if let requests = requests {
                self.quotes = requests.compactMap { QuoteRequestViewModel.from($0) }
            }

            self.applySnapshot(animatingDifferences: true)
        }
    }

    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, QuoteRequestViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(quotes)
        tableDatasource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    @objc func showQuoteWizard() {
        let wizardController = QuoteRequestWizardViewController()
        wizardController.modalPresentationStyle = .pageSheet

        present(wizardController,
                animated: true,
                completion: nil)
    }
}
