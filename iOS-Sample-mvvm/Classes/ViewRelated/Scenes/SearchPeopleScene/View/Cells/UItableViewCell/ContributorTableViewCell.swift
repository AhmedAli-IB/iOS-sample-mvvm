//
//  ContributorTableViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import UIKit

class ContributorTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    //
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var contributorImageView: UIImageView!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var contributorNameLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var contributorJobTitleLabel: UILabel!
    @IBOutlet private weak var ratingView: UIView!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    // MARK: - Properties
    //
    var viewModel: ContributorCellRepresentable? {
        didSet {
            configureCellData()
        }
    }
    
    // MARK: - Life cycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
}

// MARK: - Configure cell data
//
private extension ContributorTableViewCell {
    
    /// Configure view
    ///
    func configureView() {
        ratingView.makeCardView(cornerRadius: CGFloat(Constants.rayingViewCornerRadius))
        containerView.makeCardView( cornerRadius: CGFloat(Constants.containerCornerRadius))
        contributorImageView.layer.cornerRadius = Constants.imageCornerRadius
        imageContainerView.layer.cornerRadius = Constants.imageCornerRadius
        contributorNameLabel.textColor = Asset.ColorPalette.titleColor.color
        contributorNameLabel.font = FontFamily._29LTAzer.medium.font(size: Constants.contributorNameLabelFontSize)
        contributorJobTitleLabel.font = FontFamily._29LTAzer.regular.font(size: Constants.contributorJobLabelFontSize)
        durationLabel.font = FontFamily._29LTAzer.regular.font(size: Constants.durationLabelFontSize)
        durationLabel.textColor = Asset.ColorPalette.smeLightGray.color
        contributorJobTitleLabel.textColor = Asset.ColorPalette.smeLightGray.color
        ratingLabel.textColor = Asset.ColorPalette.primaryColor.color
        ratingLabel.font = FontFamily._29LTAzer.medium.font(size: Constants.ratingLabelFontSize)
    }
    
    /// Configure cell data
    ///
    func configureCellData() {
        contributorNameLabel.text = viewModel?.fullName
        contributorJobTitleLabel.text = viewModel?.jobTitle
        contributorImageView.setImage(representable: viewModel)
        ratingLabel.text = viewModel?.rating
    }
}

// MARK: - Constant
//
private extension ContributorTableViewCell {
    
    enum Constants {
        static let rayingViewCornerRadius = CGFloat(12)
        static let imageCornerRadius = CGFloat(16)
        static let containerCornerRadius = CGFloat(20)
        static let contributorNameLabelFontSize = CGFloat(20)
        static let contributorJobLabelFontSize = CGFloat(13)
        static let durationLabelFontSize = CGFloat(16)
        static let ratingLabelFontSize = CGFloat(17.12)
    }
}
