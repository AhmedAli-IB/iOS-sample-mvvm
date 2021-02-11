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
    
    var searchText: String
    var centers: String
    var subjects: String
    var availability: Int?
    var dates: String
    // MARK: - Init
    //
    init(searchText: String = "",
         centers: String = "",
         subjects: String = "",
         dates: String = "",
         availability: Int? = nil) {
        self.searchText = searchText
        self.subjects = subjects
        self.centers = centers
        self.availability = availability
        self.dates = dates
    }
    
    enum CodingKeys: String, CodingKey {
        case searchText = "q"
        case availability = "availability"
        case centers = "centers"
        case subjects = "subjects"
    }
}
