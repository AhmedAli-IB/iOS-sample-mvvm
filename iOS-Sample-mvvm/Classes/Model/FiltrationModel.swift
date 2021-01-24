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
    let selectedImageName: String
    let unSelectedImageName: String
}
// MARK: - Helpers
//
extension FiltrationModel {
    
   static func createFiltrationModels() -> [FiltrationModel] {
        let firstItem = FiltrationModel(filterTitle: "آونلاين",
                                        selectedImageName: Asset.Assets.icOnlineCricleSelected.name,
                                        unSelectedImageName: Asset.Assets.icOnlineCircleUnselected.name)
        let secoundItem = FiltrationModel(filterTitle: "في المركز",
                                          selectedImageName: Asset.Assets.icLocationCircleSelected.name,
                                          unSelectedImageName: Asset.Assets.icLocationCircle.name)
        let thirdItem = FiltrationModel(filterTitle: "مجالات",
                                        selectedImageName: Asset.Assets.icFieldsCircle.name,
                                        unSelectedImageName: Asset.Assets.icFieldsCircle.name)
        return [firstItem, secoundItem, thirdItem]
    }
}
