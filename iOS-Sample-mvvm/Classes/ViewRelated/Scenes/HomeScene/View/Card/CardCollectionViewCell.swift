//
//  CardCollectionViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 24/01/2021.
//

import UIKit
import Cosmos

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var userRating: CosmosView!
    @IBOutlet private weak var cancel: UIButton!
    @IBOutlet private weak var wayOfCommunication: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var userDepartment: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabelFonts()
    }
    
    @IBAction func cancelAppointment(_ sender: UIButton) {
    }
    
    func setupLabelFonts() {
        userName.font = UIFont(font: FontFamily._29LTAzer.medium, size: 18)
        userDepartment.font = UIFont(font: FontFamily._29LTAzer.medium, size: 13)
        date.font = UIFont(font: FontFamily._29LTAzer.regular, size: 16)
        wayOfCommunication.font = UIFont(font: FontFamily._29LTAzer.regular, size: 13)
        cancel.titleLabel?.font = UIFont(font: FontFamily._29LTAzer.medium, size: 15)
    }
}
