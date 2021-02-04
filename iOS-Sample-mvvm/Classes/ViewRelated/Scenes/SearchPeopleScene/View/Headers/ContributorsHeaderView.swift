//
//  ContributorsHeaderView.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import UIKit

class ContributorsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var headerTitleLabel: UILabel!
    
    /// Configure view
    ///
    func configure(title: String,
                   font: UIFont = FontFamily._29LTAzer.medium.font(size: Constants.headerFountSize),
                   color: UIColor = Asset.ColorPalette.primaryColor.color ) {
        headerTitleLabel.text = title
        headerTitleLabel.textColor = color
        headerTitleLabel.font = font
    }
}
// MARK: - Constants
//
private extension ContributorsHeaderView {
    
    // MARK: - Constants
    //
    enum Constants {
        static let headerFountSize = CGFloat(18)
    }
    
}
