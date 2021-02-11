//
//  FiltrationCell + Representable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

// MARK: - Filtration Cell Representable
//
extension FiltrationModel: FiltrationCellRepresentable {
    
    var isPicked: Bool {
        isSelected
    }
    
    var filtrationTitle: String {
        return filterTitle
    }
    
    var filtrationSelectedImageName: String {
        return selectedImageName
    }
    
    var filtrationUnselectedImageName: String {
        return unSelectedImageName
    }
    var isExpanded: Bool {
        return expanded
    }
}
