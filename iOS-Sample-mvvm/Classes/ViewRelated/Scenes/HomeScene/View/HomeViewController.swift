//
//  HomeViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var upcommingSessionLogo: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel: HomeViewModel = HomeViewModel()

    // MARK: - Properties
    //
    private lazy var noInternetView = NoInternet(with: self)
    var coordinator: HomeCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        bindLoadingState(to: viewModel)
        bindViewModelErrorState()
        viewModel.getSessions()
        viewModel.getStaticSessionsData()
        configureViewModel()

    }
    
    @IBAction func searchTapped(_ sender: Any) {
        coordinator?.pushSerchViewController()
    }
}

private extension HomeViewController {
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: SessionTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: SessionTableViewCell.reuseIdentifier)
    }
    
     func reloadDataAndSections() {
        self.tableView.estimatedRowHeight = CGFloat(Constants.tabelViewCellEstimatedHeight)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.isHidden = false
        self.noInternetView.removeFromSuperview()
        self.tableView.reloadData()
    }
    
    /// Configure tableview and collectionview on viewmodel reload data and network failure
    ///
    func configureViewModel() {
        
        viewModel.onReloadNeeded.subscribe { [weak self] _ in
            guard  let self = self else { return }
            self.reloadDataAndSections()
        }

    }
     func setupNoInternetView() {
        tableView.isHidden = true
        configureNoInternetView()
    }
    
    /// Bind on error state (No internet connection)
    ///
    func bindViewModelErrorState() {
        viewModel.state.subscribe { [weak self] state in
            if case .failure(let error) = state {
             guard  let self = self else { return }
                let noInternetError = HomeError.noInternet.localizedDescription
                error == noInternetError ?  self.setupNoInternetView() : self.showErrorAlert(error: error)
            }
        }
    }
        /// Configure no internet view constraints and center in superview
        ///
        func configureNoInternetView() {
            
            self.view.addSubview(noInternetView)
            
            self.noInternetView.translatesAutoresizingMaskIntoConstraints = false

            self.noInternetView.widthAnchor.constraint(equalToConstant: Constants.noInternetViewWidthAndHight)
                .isActive = true
            self.noInternetView.heightAnchor.constraint(equalToConstant: Constants.noInternetViewWidthAndHight)
                .isActive = true
            self.noInternetView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.noInternetView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
        
    }

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.loadView(fromNib: Strings.tableViewHeader,
                                         withType: TableViewHeader.self)
        return headerView
    }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.tabelViewCellEstimatedHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.staticDataNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SessionTableViewCell.reuseIdentifier,
                                                 for: indexPath) as? SessionTableViewCell
        guard let sessionCell = cell else {
            fatalError("Unexpected cell sent to \(#function)")
        }
        sessionCell.viewModel = viewModel.getCurrentObject(for: indexPath)
        return sessionCell
    }
}

// MARK: - NoInternetView
/// Conform to no internet view protocol to handle reload action
//
extension HomeViewController: NoInternetView {
    
    func tryAgain() {
        viewModel.getSessions()
    }
}

private extension HomeViewController {
    
    // MARK: - Strings
    //
    enum Strings {
        static let tableViewHeader = "TableViewHeader"
    }
    
    // MARK: - Constants
    //
    enum Constants {
        static let noInternetViewTopConstraint = 100.0
        static let numberOfCardsPreBussiness = 5
        static let tabelViewCellEstimatedHeight = 114.0
        static let collectionViewCellHeight = 211.0
        static let collectionViewCellWidth = 345.0
        static let noInternetViewWidthAndHight = CGFloat(390.0)
        static let heightForHeaderInSection = CGFloat(264.0)
    }
}
