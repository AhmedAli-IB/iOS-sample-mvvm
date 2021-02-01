//
//  HomeViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet private weak var upcommingSessionLogo: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    private let viewModel: HomeViewModel = HomeViewModel()
    private let staticData = StaticSessionsData()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureAppearance()
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        configureViewModel()
        viewModel.getSessions()
    }

    @IBAction func searchTapped(_ sender: Any) {
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
    
    func configureTableView() {

        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = viewModel.numberOfRows
        
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: Strings.tableViewCellId, bundle: nil),
                           forCellReuseIdentifier: Strings.tableViewCellId)
        collectionView.register(UINib(nibName: Strings.collectionViewCellId, bundle: nil),
                                forCellWithReuseIdentifier: Strings.collectionViewCellId)
    }
    
    func configureViewModel() {
        viewModel.onReload = { [weak self] in
            guard  let self = self else { return }
            self.tableViewHeightConstraint.constant = self.tableView.contentSize.height
            self.tableView.reloadData()
            self.collectionView.reloadData()
        }
    }
}

private extension HomeViewController {
    
    enum Strings {
        static let collectionViewCellId = "CardCollectionViewCell"
        static let tableViewCellId = "SessionTableViewCell"
    }
    
    enum Constants {
       
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if viewModel.numberOfRows > 5 {
            return 5
        } else if viewModel.numberOfRows == 0 {
            return 1
        }
        return viewModel.numberOfRows
//        return 5
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.collectionViewCellId,
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

        return CGSize(width: 345, height: 211)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticData.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.tableViewCellId,
                                                 for: indexPath) as? SessionTableViewCell
        guard let sessionCell = cell else {
            fatalError("Unexpected cell sent to \(#function)")
        }
        sessionCell.setupCellData(staticSession: staticData.arr[indexPath.row])
        return sessionCell
    }
}
