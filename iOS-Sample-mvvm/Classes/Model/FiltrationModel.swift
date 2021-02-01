//
//  FiltrationModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import Foundation

// MARK: - Filtration Model
/// Model for render filtration items in search screen
///
struct FiltrationModel {
    let filterTitle: String
    let selectedImageName: String
    let unSelectedImageName: String
    let expanded: Bool
    let filtrationType: FiltrationModelType
}
// MARK: - Helpers
//
extension FiltrationModel {
    
    static func createFiltrationModels() -> [FiltrationModel] {
        
        let  firstItem = FiltrationModel(filterTitle: Strings.fields,
                                         selectedImageName: Asset.Assets.icFieldsCircle.name,
                                         unSelectedImageName: Asset.Assets.icFieldsCircle.name,
                                         expanded: true, filtrationType: .fields)
        
        let secoundItem = FiltrationModel(filterTitle: Strings.inCenter,
                                          selectedImageName: Asset.Assets.icLocationCircleSelected.name,
                                          unSelectedImageName: Asset.Assets.icLocationCircle.name,
                                          expanded: true, filtrationType: .location)
        let thirdItem = FiltrationModel(filterTitle: Strings.online,
                                        selectedImageName: Asset.Assets.icOnlineCricleSelected.name,
                                        unSelectedImageName: Asset.Assets.icOnlineCircleUnselected.name,
                                        expanded: false, filtrationType: .online)
        
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

enum FiltrationModelType {
    case online
    case fields
    case location
}
