//
//  CardCollectionViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 24/01/2021.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cancel: UIButton!
    @IBOutlet private weak var wayOfCommunication: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var userRating: UIView!
    @IBOutlet private weak var userDepartment: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func cancelAppointment(_ sender: UIButton) {
    }
}
