//
//  CenterModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation
// MARK: - CenterModel
//
struct CenterModel {
    let centerName: String
    let id: String
    let centerAddress: String
    var isSelected: Bool = false
}

// MARK: - CenterModel Init Helper
//
extension CenterModel {
    
    init?(center data: CenterResponse) {
        guard
            let centerName = data.name,
            let id = data.id,
            let centerAddress = data.address else {
            return nil
        }
        self.init(centerName: centerName, id: id, centerAddress: centerAddress)
    }
}

extension CenterModel: Equatable {
    /// Returns whether the two schemas are equal.
    public static func == (lhs: CenterModel, rhs: CenterModel) -> Bool {
        return lhs.id.isEqual(rhs.id)
    }
}
