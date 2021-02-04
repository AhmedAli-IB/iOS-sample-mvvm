//
//  CenterTableViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import UIKit

class CenterTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    //
    @IBOutlet private weak var centerNameLabel: UILabel!
    @IBOutlet private weak var centerAddressLabel: UILabel!
    
    // MARK: - Properties
    //
    var viewModel: CenterCellRepresentable? {
        didSet {
            configureCell()
        }
    }
    // MARK: - Lifecycle
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

// MARK: - Configurations
//
extension CenterTableViewCell {

    /// Configure cell
    ///
    func configureCell() {
        centerNameLabel.text = viewModel?.name
        centerNameLabel.textColor = Asset.ColorPalette.smeBlack.color
        centerNameLabel.font = FontFamily._29LTAzer.medium.font(size: Constants.centerNameLabelFontSize)
        centerAddressLabel.textColor = Asset.ColorPalette.smeLightGray.color
        centerNameLabel.font = FontFamily._29LTAzer.regular.font(size: Constants.centerAddressLabelFontSize)
        centerAddressLabel.text = viewModel?.address
        viewModel?.isPicked ?? false ? (self.accessoryType = .checkmark) : (self.accessoryType = .none)
    }
}

// MARK: - Constants
//
private extension CenterTableViewCell {
    
    // MARK: - Constants
    //
    enum Constants {
        static let centerNameLabelFontSize = CGFloat(17)
        static let centerAddressLabelFontSize = CGFloat(16)
    }
}
