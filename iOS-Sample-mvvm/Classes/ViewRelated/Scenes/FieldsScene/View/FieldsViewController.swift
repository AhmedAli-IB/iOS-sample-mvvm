//
//  FieldsViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

// MARK: - FieldsViewController
/// `FieldsViewController`  responsible for filter contributors with fields
//
class FieldsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    //
    let viewModel = FieldsViewModel()
    
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupCollectionView()
        configureViewModel()
    }
    
}
// MARK: - Configure View
//
private extension FieldsViewController {
    
    func registerCells() {
        let cellNib = UINib(nibName: FieldsCollectionViewCell.classNameWithoutNamespaces, bundle: nil)
        collectionView.register(cellNib,
                                forCellWithReuseIdentifier: FieldsCollectionViewCell.reuseIdentifier)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
    }
    
    func configureViewModel() {
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        viewModel.onReloadNeeded.subscribe { [weak self] _ in
            self?.reloadSectionsAndData()
        }
        viewModel.viewDidLoad()
    }
    func reloadSectionsAndData() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate && UICollectionViewDataSource
//
extension FieldsViewController: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItms
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier  = FieldsCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? FieldsCollectionViewCell
        cell?.viewModel = viewModel.getSubjectItem(indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item =  viewModel.getSubjectItem(indexPath: indexPath)
        return CGSize(width: calculateItemWidth(item: item), height: Constants.collectionItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
// MARK: - Helpers
//
private extension FieldsViewController {
    
    /// calculate item wifth based on title text
    /// - Returns: cell width
    func calculateItemWidth(item: SubjectModel) -> CGFloat {
        let itemFont =  UIFont.systemFont(ofSize: Constants.itemFontSize)
        let  itemTextWidth = item.subjectName.size(withAttributes: [.font: itemFont])
        return CGFloat(itemTextWidth.width + Constants.staticWidth)
    }
}

// MARK: - Constants
//
private extension FieldsViewController {
    enum Constants {
        static let staticWidth = CGFloat(32)
        static let collectionItemHeight = CGFloat(60)
        static let itemFontSize = CGFloat(17)
    }
}
