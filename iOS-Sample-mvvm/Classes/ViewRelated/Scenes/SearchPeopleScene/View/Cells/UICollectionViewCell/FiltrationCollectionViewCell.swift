//
//  FiltrationCollectionViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import UIKit

class FiltrationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    //
    @IBOutlet weak private var selectionView: UIView!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var filtrationImageView: UIImageView!
    
    // MARK: - Init
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
}

// MARK: - Configure View
//
 extension FiltrationCollectionViewCell {
    
    /// Configure view
    ///
    func configureView() {
        containerView.layer.cornerRadius = Constants.containerCornerRadius
    }
    
}

// MARK: - Constants
//
private extension FiltrationCollectionViewCell {
    
    enum Constants {
        static let containerCornerRadius = CGFloat(16)
    }
}
