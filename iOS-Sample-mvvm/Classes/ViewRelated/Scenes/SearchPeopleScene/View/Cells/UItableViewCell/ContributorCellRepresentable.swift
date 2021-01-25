//
//  ContributorCellRepresentable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import Foundation

// MARK: - Contributor cell representable
/// Used for configure cell data
///
protocol ContributorCellRepresentable: ImageRepresentable {
    var fullName: String { get }
    var jobTitle: String { get }
    var rating: Double { get }
}
