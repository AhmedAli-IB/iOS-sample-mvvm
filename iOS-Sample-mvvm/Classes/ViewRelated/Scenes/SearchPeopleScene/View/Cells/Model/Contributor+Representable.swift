//
//  Contributor+Representable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import UIKit

// MARK: - Contributor + ContributorCellRepresentable
/// Configure cell data
///
extension Contributor: ContributorCellRepresentable {
    
    var fullName: String {
        contributorName
    }
    
    var jobTitle: String {
        contributorJobTitle
    }
    
    var rating: String {
        "\(contributorRating)"
    }
    
    var imageURL: String? {
        contributorImage
    }
    
    var placeholderImage: UIImage? {
        Asset.Assets.placeholder.image
    }
}
