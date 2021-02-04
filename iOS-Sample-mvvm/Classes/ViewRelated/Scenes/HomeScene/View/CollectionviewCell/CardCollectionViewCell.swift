//
//  CardCollectionViewCell.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 24/01/2021.
//

import UIKit
import Cosmos

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var displayAvaSessionsLabel: UILabel!
    @IBOutlet private weak var noSessionsLabel: UILabel!
    @IBOutlet private weak var emptyStateView: UIView!
    @IBOutlet private weak var userRating: CosmosView!
    @IBOutlet private weak var cancel: UIButton!
    @IBOutlet private weak var wayOfCommunication: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var userDepartment: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var officeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        emptyStateView.isHidden = true
        setupLabelFonts()
        setupImageView()
    }
    
    @IBAction func cancelAppointment(_ sender: UIButton) {
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }
    
    func setupLabelFonts() {
        userName.font = UIFont(font: FontFamily._29LTAzer.medium, size: 18)
        userDepartment.font = UIFont(font: FontFamily._29LTAzer.medium, size: 13)
        date.font = UIFont(font: FontFamily._29LTAzer.regular, size: 16)
        wayOfCommunication.font = UIFont(font: FontFamily._29LTAzer.regular, size: 13)
        cancel.titleLabel?.font = UIFont(font: FontFamily._29LTAzer.medium, size: 15)
        noSessionsLabel.font = UIFont(font: FontFamily._29LTAzer.medium, size: 16)
        displayAvaSessionsLabel.font = UIFont(font: FontFamily._29LTAzer.medium, size: 16)

    }
    
    func setupImageView() {
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 3
        userImage.layer.borderColor = UIColor(asset: Asset.ColorPalette.platinum)?.cgColor
        userImage.layer.cornerRadius = 16
    }
    
    func setupEmptySessionView() {
        emptyStateView.isHidden = false
    }
    
    func setupCellData(session: SessionsData) {
        userName.text = session.schedule?.contributor?.ssoUser?.fullName
        
        userDepartment.text = session.schedule?.contributor?.subject?.title
        if(session.type == 1) {
            userDepartment.textColor = UIColor(asset: Asset.ColorPalette.steelBlue)

        } else if(session.type == 2) {
            userDepartment.textColor = UIColor(asset: Asset.ColorPalette.mantis)

        } else {
            userDepartment.textColor = UIColor(asset: Asset.ColorPalette.persianOrange)
        }
        userRating.rating = Double(session.schedule?.contributor?.rating ?? 0)
        userRating.text = String(format: "%.1f", session.schedule?.contributor?.rating ?? 0)

        userImage.setImage(urlString: session.schedule?.contributor?.file?.path,
                           placeholder: #imageLiteral(resourceName: "Item_2_Copy"))
        if(session.schedule?.communicationWay == 1) {
            wayOfCommunication.text = Strings.online
            
        } else {
            wayOfCommunication.text = Strings.office
//            officeName.text = session.office
        }
        date.text = formateDateToArabic(timeResult: session.schedule?.startDate ?? 0)
    }
    
    func formateDateToArabic(timeResult: Int) -> String {
        
        let formatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(timeResult))
        formatter.locale = NSLocale(localeIdentifier: "ar_DZ") as Locale
        formatter.dateFormat = "EEEE, d, MMMM"
        return formatter.string(from: date)
    }
}

private extension CardCollectionViewCell {
    
    enum Strings {
        static let online = "Online"
        static let office = "In Office"
    }

}
