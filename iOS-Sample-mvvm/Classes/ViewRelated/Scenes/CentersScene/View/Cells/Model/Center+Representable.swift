//
//  Center+Representable.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

extension CenterModel: CenterCellRepresentable {
    
    var name: String {
        return centerName
    }
    
    var address: String {
        return centerAddress
    }
}
