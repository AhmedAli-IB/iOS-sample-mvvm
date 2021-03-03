//
//  HomeError.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 27/01/2021.
//

import Foundation

extension HomeError: LocalizedError {
    
     var errorDescription: String? {
        switch self {
        case .unableToGetSessions:
            return "Couldn't get these info now, please try again later"
        case .noInternet:
            return "No internet connection please try agin later."
        }
    }
}
