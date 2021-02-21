//
//  SessionTableViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 24/01/2021.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cellDescription: UILabel!
    @IBOutlet private weak var cellTitle: UILabel!
    @IBOutlet private weak var cellIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabelFonts()
    }
    
    // MARK: - ViewModel
    //
    var viewModel: StaticSessionDataRepresentable? {
        didSet {
            configureCell()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func setupLabelFonts() {
        cellTitle.font = UIFont(font: FontFamily._29LTAzer.medium, size: 20)
        cellDescription.font = UIFont(font: FontFamily._29LTAzer.regular, size: 15)
    }
    
    func configureCell() {
        cellTitle.text = viewModel?.sessionTitle
        cellDescription.text = viewModel?.sessionDescription
        cellIcon.setImage(representable: viewModel)
        cellTitle.textColor = viewModel?.sessionColor
    }
}
