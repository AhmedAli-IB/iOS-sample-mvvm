//
//  FiltrationCellRepresentable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

protocol FiltrationCellRepresentable {
    var filtrationTitle: String { get }
    var filtrationSelectedImageName: String { get }
    var filtrationUnselectedImageName: String { get }
    var isExpanded: Bool { get }
}
