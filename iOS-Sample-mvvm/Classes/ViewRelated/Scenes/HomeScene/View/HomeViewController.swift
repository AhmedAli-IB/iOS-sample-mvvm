//
//  HomeViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet private weak var superView: UIView!
    @IBOutlet private weak var upcommingSessionLogo: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    private let viewModel: HomeViewModel = HomeViewModel()

    private lazy var noInternetView = NoInternet(with: self)
    
    var coordinator: HomeCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureAppearance()
        bindLoadingState(to: viewModel)
//        bindErrorState(to: viewModel)
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
    
    func configureAppearance() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                                    for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func configureView() {

        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        if viewModel.numberOfRows == 0 {
            collectionView.isScrollEnabled = false
        }
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = viewModel.numberOfRows
        
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: SessionTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: SessionTableViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: CardCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
    }
    
     func reloadDataAndSections() {
        self.tableViewHeightConstraint.constant = self.tableView.contentSize.height
        self.tableView.estimatedRowHeight = CGFloat(Constants.tabelViewCellEstimatedHeight)
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.collectionView.isHidden = false
        self.tableView.isHidden = false
        self.noInternetView.removeFromSuperview()
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
    
    /// Configure tableview and collectionview on viewmodel reload data and network failure
    func configureViewModel() {
        
        viewModel.onReloadNeeded.subscribe { [weak self] _ in
            guard  let self = self else { return }
            self.reloadDataAndSections()
        }

    }
     func setupNoInternetView() {
        collectionView.isHidden = true
        tableView.isHidden = true
        superView.addSubview(self.noInternetView)
        configureNoInternetView()
    }
    
    /// Bind on error state (No internet connection)
    ///
    func bindViewModelErrorState() {
        viewModel.state.subscribe { [weak self] state in
            if case .failure(let error) = state {
             guard  let self = self else { return }
                error.isEmpty ?  self.setupNoInternetView() : self.showErrorAlert(error: error)
            }
        }
    }
        /// Configure no internet view constraints and center in superview
        func configureNoInternetView() {
            self.noInternetView.translatesAutoresizingMaskIntoConstraints = false
            self.noInternetView.topAnchor.constraint(equalTo: self.superView.topAnchor,
                                                     constant: CGFloat(Constants.noInternetViewTopConstraint))
                .isActive = true
            self.noInternetView.bottomAnchor.constraint(equalTo: self.superView.bottomAnchor,
                                                        constant: 0).isActive = true
            self.noInternetView.centerYAnchor.constraint(equalTo: self.superView.centerYAnchor,
                                                         constant: 0).isActive = true
        }
        
    }

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if viewModel.numberOfRows > Constants.numberOfCardsPreBussiness {
            return Constants.numberOfCardsPreBussiness
        } else if viewModel.numberOfRows == 0 {
            return 1
        }
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier,
                                                      for: indexPath) as? CardCollectionViewCell
        guard let cardCell = cell else {
            fatalError("Unexpected cell sent to \(#function)")
        }
        if viewModel.numberOfRows == 0 {
            cardCell.setupEmptySessionView()
        } else {
            cardCell.setupCellData(session: viewModel.getCurrentObject(for: indexPath))
        }
        return cardCell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = Double(view.frame.width - 30)
        return CGSize(width: width,
                      height: Constants.collectionViewCellHeight)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
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

extension HomeViewController: NoInternetView {
    
    func tryAgain() {
        viewModel.getSessions()
    }
}

private extension HomeViewController {
    
    enum Constants {
        static let noInternetViewTopConstraint = 100.0
        static let numberOfCardsPreBussiness = 5
        static let tabelViewCellEstimatedHeight = 114.0
        static let collectionViewCellHeight = 211.0
        static let collectionViewCellWidth = 345.0
    }
}
