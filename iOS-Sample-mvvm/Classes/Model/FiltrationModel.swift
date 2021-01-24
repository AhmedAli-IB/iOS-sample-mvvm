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
    let expanded: Bool
}
// MARK: - Helpers
//
extension FiltrationModel {
    
   static func createFiltrationModels() -> [FiltrationModel] {
    let firstItem = FiltrationModel(filterTitle: Strings.online,
                                    selectedImageName: Asset.Assets.icOnlineCricleSelected.name,
                                    unSelectedImageName: Asset.Assets.icOnlineCircleUnselected.name,
                                    expanded: false)
    let secoundItem = FiltrationModel(filterTitle: Strings.inCenter,
                                      selectedImageName: Asset.Assets.icLocationCircleSelected.name,
                                      unSelectedImageName: Asset.Assets.icLocationCircle.name,
                                      expanded: true)
    let thirdItem = FiltrationModel(filterTitle: Strings.fields,
                                    selectedImageName: Asset.Assets.icFieldsCircle.name,
                                    unSelectedImageName: Asset.Assets.icFieldsCircle.name,
                                    expanded: true)
        return [firstItem, secoundItem, thirdItem]
    }
}

// MARK: - Strings
//
private extension FiltrationModel {
    enum Strings {
        static let online = "آونلاين"
        static let inCenter = "في المركز"
        static let fields = "مجالات"
    }
}
