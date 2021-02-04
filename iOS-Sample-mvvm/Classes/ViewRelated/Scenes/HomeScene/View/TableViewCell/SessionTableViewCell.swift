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
    
    func setupCellData(staticSession: StaticSessionData) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(staticSession) {
            
            let decoder = JSONDecoder()
            if let decodedSession = try? decoder.decode(StaticSessionData.self, from: encoded) {
                cellTitle.text = decodedSession.title
                cellDescription.text = decodedSession.description
                cellIcon.image = UIImage(named: decodedSession.icon)
                cellTitle.textColor = UIColor(named: decodedSession.color)
            }
        }
    }
}
