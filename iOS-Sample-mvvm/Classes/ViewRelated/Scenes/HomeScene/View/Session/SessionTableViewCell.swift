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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func setupLabelFonts() {
        cellTitle.font = UIFont(font: FontFamily._29LTAzer.medium, size: 20)
        cellDescription.font = UIFont(font: FontFamily._29LTAzer.regular, size: 15)
    }
    
    func setupCellData(staticSession: [String: String]) {
        cellTitle.text = staticSession["title"]
        cellDescription.text = staticSession["description"]
        cellIcon.image = UIImage(named: staticSession["icon"] ?? "")
        cellTitle.textColor = UIColor(named: staticSession["color"] ?? "")
    }
}
