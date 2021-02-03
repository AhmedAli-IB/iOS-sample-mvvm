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
    @IBOutlet weak var separationVeiw: UIView!
    
    // MARK: - Init
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
//    override var isSelected: Bool {
//        get {
//            return super.isSelected
//        }
//        set {
//            super.isSelected = newValue
//            updateViewForSelectedState()
//        }
//    }
    
    // MARK: - ViewModel
    //
    var viewModel: FiltrationCellRepresentable? {
        didSet {
            configureCell()
        }
    }
}

// MARK: - Configure View
//
private extension FiltrationCollectionViewCell {
    
    /// Configure view
    ///
    func configureView() {
        containerView.layer.cornerRadius = Constants.containerCornerRadius
        containerView.backgroundColor = Asset.ColorPalette.unselectedColor.color
        titleLabel.textColor = Asset.ColorPalette.smeGray.color
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: Constants.titleLabelFontSize)
    }
    
    /// Configure cell data
    ///
    func configureCell() {
        titleLabel.text = viewModel?.filtrationTitle
        filtrationImageView.image = UIImage(named: viewModel?.filtrationUnselectedImageName ?? "placeholder")
        viewModel?.isExpanded ?? false ? showSelectionView() : hideSelectionView()
        viewModel?.isPicked ?? false ? makeSelected() : makeUnSelected()
    }
    
    /// Hide selection \view
    ///
    func hideSelectionView() {
        selectionView.isHidden = true
    }
    
    /// Show selection \view
    ///
    func showSelectionView() {
        selectionView.isHidden = false
    }
    /// Toggle state
    ///
    func updateViewForSelectedState() {
        isSelected ? makeSelected() : makeUnSelected()
        
    }
    
    func makeSelected() {
        containerView.backgroundColor = Asset.ColorPalette.selectedColor.color
        filtrationImageView.image = UIImage(named: viewModel?.filtrationSelectedImageName ?? "placeholder")
        titleLabel.textColor = .white
        separationVeiw.backgroundColor = .white

    }
    
    func makeUnSelected() {
        containerView.backgroundColor = Asset.ColorPalette.unselectedColor.color
        filtrationImageView.image = UIImage(named: viewModel?.filtrationUnselectedImageName ?? "placeholder")
        titleLabel.textColor = Asset.ColorPalette.smeGray.color
        separationVeiw.backgroundColor = Asset.ColorPalette.smeGray.color
    }
    
}

// MARK: - Constants
//
private extension FiltrationCollectionViewCell {
    
    enum Constants {
        static let containerCornerRadius = CGFloat(16)
        static let titleLabelFontSize = CGFloat(14)

    }
}
