//
//  FiltrationModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import Foundation

// MARK: - Filtration Model
/// Model for render filtration items in search screen

struct FiltrationModel {
    let filterTitle: String
    let imageURL: String
}
// MARK: - Helpers
//
extension FiltrationModel {
    
   static func createFiltrationModels() -> [FiltrationModel] {
        let firstItem = FiltrationModel(filterTitle: "آونلاين", imageURL: "ic_online-cricle")
        let secoundItem = FiltrationModel(filterTitle: "في المركز", imageURL: "ic_location-circle")
        let thirdItem = FiltrationModel(filterTitle: "مجالات", imageURL: "ic_fields-circle")
        return [firstItem, secoundItem, thirdItem]
    }
}
