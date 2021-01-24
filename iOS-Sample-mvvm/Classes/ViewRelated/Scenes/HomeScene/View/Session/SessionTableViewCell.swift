//
//  SessionTableViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 24/01/2021.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var description: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupLabelFonts() {
        title.font = UIFont(font: FontFamily._29LTAzer.medium, size: 20)
        description.font = UIFont(font: FontFamily._29LTAzer.regular, size: 15)
    }
}
