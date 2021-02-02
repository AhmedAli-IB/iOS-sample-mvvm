//
//  FieldsCollectionViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

class FieldsCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var subjectNameLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        // Initialization code
    }
   
    var viewModel: FieldsCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}

// MARK: - Helpers
//
extension FieldsCollectionViewCell {
    
    func makeSelected() {
        containerView.backgroundColor = Asset.ColorPalette.selectedColor.color
    }
    
    func makeUnSelected() {
        containerView.backgroundColor = Asset.ColorPalette.unselectedColor.color
    }
}

// MARK: - Configure
//
extension FieldsCollectionViewCell {
    
    /// Configure Cell
    ///
    func configureCell() {
        subjectNameLabel.text = viewModel?.fieldsSubjectName
        viewModel?.isPicked ?? false ? makeSelected() : makeUnSelected()
    }
    /// ConfigureView
    ///
    func configureView() {
        containerView.makeCardView( cornerRadius: 16)
    }
}
