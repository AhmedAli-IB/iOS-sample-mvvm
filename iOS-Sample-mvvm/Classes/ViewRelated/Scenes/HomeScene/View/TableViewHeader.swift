//
//  TableViewHeader.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 26/02/2021.
//

import UIKit


class TableViewHeader: UIView {
    
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let viewModel: HomeViewModel = HomeViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()

        viewModel.getSessions()
        viewModel.getStaticSessionsData()
        configureViewModel()

    }

    func configureView() {

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
        collectionView.register(UINib(nibName: CardCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
    }
    
     func reloadDataAndSections() {
        self.collectionView.isHidden = false
        self.collectionView.reloadData()
    }
    
    /// Configure tableview and collectionview on viewmodel reload data and network failure
    func configureViewModel() {
        
        viewModel.onReloadNeeded.subscribe { [weak self] _ in
            guard  let self = self else { return }
            self.reloadDataAndSections()
        }
    }
}

extension TableViewHeader: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if viewModel.numberOfRows > 5 {
            return 5
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

        let width = Double(UIScreen.main.bounds.width - 30)
        return CGSize(width: width,
                      height: 211.0)
    }
}
