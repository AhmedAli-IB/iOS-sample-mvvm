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
    @IBOutlet private weak var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupLabelFonts() {
        cellTitle.font = UIFont(font: FontFamily._29LTAzer.medium, size: 20)
        cellDescription.font = UIFont(font: FontFamily._29LTAzer.regular, size: 15)
    }
}
