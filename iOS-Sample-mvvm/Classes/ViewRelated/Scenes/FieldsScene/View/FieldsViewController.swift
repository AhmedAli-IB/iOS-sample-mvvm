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
class FieldsViewController: UIViewController {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var collectionView: UICollectionView!
    private let models: [SubjectModel] = [SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "إدارة الجودة"),
                                          SubjectModel(subjectName: "دراسات الجدوى و خطط الأعمال"),
                                          SubjectModel(subjectName: "إدارة الجودة"),
                                          SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "القانونية"),
                                          SubjectModel(subjectName: "إدارة الجودة"),
                                          SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "التمويل و الاستثمار "),
                                          SubjectModel(subjectName: "التمويل و الاستثمار ")]
    
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupCollectionView()
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
}

// MARK: - UICollectionViewDelegate && UICollectionViewDataSource
//
extension FieldsViewController: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier  = FieldsCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? FieldsCollectionViewCell
        cell?.viewModel = models[indexPath.item]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item =  models[indexPath.row]
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
        static let staticWidth = CGFloat(24)
        static let collectionItemHeight = CGFloat(60)
        static let itemFontSize = CGFloat(17)
    }
}
