//
//  Contributor.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import Foundation

// MARK: - Contributor
//
struct Contributor {
    let contributorName: String
    let contributorImage: String
    let contributorJobTitle: String
    let contributorRating: Double
    let online: Bool
    let avaliablity: Int
}

// MARK: - Contributor Init Helper
//
extension Contributor {
    
    init?(contributor data: ContributorsResponse) {
        guard
            let contributorName = data.ssoUser?.fullName,
            let contributorJobTitle = data.subject?.title,
            let contributorRating = data.rating,
            let avaliablity = data.availability,
            let online = data.isOnline else {
            return nil
        }
        self.init(contributorName: contributorName,
                  contributorImage: data.file?.path ?? "",
                  contributorJobTitle: contributorJobTitle,
                  contributorRating: contributorRating, online: online, avaliablity: avaliablity)
    }
}
