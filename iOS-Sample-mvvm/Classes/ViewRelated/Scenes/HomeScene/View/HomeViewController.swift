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
    
    private let viewModel: HomeViewModel = HomeViewModel()
    private let staticData = StaticSessionsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeaderView()
        configureTableView()
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        configureViewModel()
        viewModel.getSessions()
    }

    @IBAction func searchTapped(_ sender: Any) {
    }
}

private extension HomeViewController {
    
//    func configureView() {
//        configureHeaderView()
//    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: Strings.tableViewCellId, bundle: nil),
                           forCellReuseIdentifier: Strings.tableViewCellId)
        
    }
    
    func configureViewModel() {
        viewModel.onReload = { [weak self] in
            guard  let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

private extension HomeViewController {
    
    enum Strings {
        static let collectionViewCellId = "CardCollectionViewCell"
        static let tableViewCellId = "SessionTableViewCell"
        static let headerView = "headerView"
    }
    
    enum Constants {
       
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configureHeaderView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        let pageControl =  UIPageControl(frame: .zero)
        let headerView = UICollectionView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 345,
                                                        height: 264),
                                          collectionViewLayout: layout)
        
//        pageControl.numberOfPages = 5
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.currentPageIndicatorTintColor = .blue
//        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        
//        let bottom = NSLayoutConstraint(item: pageControl,
//                                        attribute: .bottom,
//                                        relatedBy: .equal,
//                                        toItem: headerView,
//                                        attribute: .bottom,
//                                        multiplier: 1,
//                                        constant: 18)

//        pageControl.addConstraint(<#T##constraint: NSLayoutConstraint##NSLayoutConstraint#>)
//        pageControl.numberOfPages = 3
//        pageControl.currentPage = 0
//        pageControl.tintColor = .red
//        pageControl.pageIndicatorTintColor = .black
//        pageControl.currentPageIndicatorTintColor = .gray
        
        headerView.backgroundColor = .clear
        headerView.isPagingEnabled = true
        headerView.isUserInteractionEnabled = true

        headerView.dataSource = self
        headerView.delegate = self
        headerView.register(UINib(nibName: Strings.collectionViewCellId,
                                  bundle: nil),
                            forCellWithReuseIdentifier: Strings.collectionViewCellId)
        
        headerView.showsHorizontalScrollIndicator = false
        
//        headerView.insertSubview(pageControl, at: 0)
//        headerView.bringSubviewToFront(pageControl)
//        headerView.addConstraints([bottom])
        
//        headerView.addSubview(pageControl)
        tableView.tableHeaderView = headerView
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfRows > 5 {
            return 5
        }
        print("viewModel.numberOfRows \(viewModel.numberOfRows)")
        return viewModel.numberOfRows
//        return 5
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        willDisplay cell: UICollectionViewCell,
//                        forItemAt indexPath: IndexPath) {
//        self.
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.collectionViewCellId,
                                                      for: indexPath) as? CardCollectionViewCell
        guard let cardCell = cell else {
            fatalError("Unexpected cell sent to \(#function)")
        }
        cardCell.setupCellData(session: viewModel.getCurrentObject(for: indexPath))
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
        return 144.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//           return 264
//    }
    
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
