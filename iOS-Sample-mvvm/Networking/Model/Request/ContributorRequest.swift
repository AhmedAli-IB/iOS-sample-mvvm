//
//  ContributorRequest.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import Foundation

// MARK: - ContributorRequest
//
struct ContributorRequest: Encodable {
    
    let searchText: String
    
    // MARK: - Init
    //
    init(searchText: String = "") {
        self.searchText = searchText
    }
    
    enum CodingKeys: String, CodingKey {
        case searchText = "q"
    }
}
