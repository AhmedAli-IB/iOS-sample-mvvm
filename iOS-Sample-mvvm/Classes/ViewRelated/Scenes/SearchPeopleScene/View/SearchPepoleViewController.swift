//
//  SearchPepoleViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

class SearchPepoleViewController: UIViewController {

    // MARK: - IBOutlets
    //
    @IBOutlet weak private var searchBar: SMESearchBar!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Configure View
//
private extension SearchPepoleViewController {
    
    /// Configure view
    ///
    func configureView() {
        searchBar.searchTextField.placeholder = Strings.searchBarBlaceholder
        registerCells()
        setupCollectionView()
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: FiltrationCollectionViewCell.classNameWithoutNamespaces, bundle: nil)
        collectionView.register(cellNib,
                                forCellWithReuseIdentifier: FiltrationCollectionViewCell.reuseIdentifier)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
// MARK: - Strings
//
private extension SearchPepoleViewController {
    enum Strings {
       static let searchBarBlaceholder = "البحث"
    }
}

extension SearchPepoleViewController: UICollectionViewDelegate,
                                      UICollectionViewDataSource,
                                      UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier  = FiltrationCollectionViewCell.reuseIdentifier
        // swiftlint:disable all
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as! FiltrationCollectionViewCell
        cell.configureView()
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 100, height: 40)
//    }
}
