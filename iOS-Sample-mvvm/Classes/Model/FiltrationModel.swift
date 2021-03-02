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
    var isSelected: Bool
}
// MARK: - Helpers
//
extension FiltrationModel {
    
    static func createFiltrationModels() -> [FiltrationModel] {
        
        let datesItem = FiltrationModel(filterTitle: Strings.calendar,
                                        selectedImageName: Asset.Assets.icCalendarCircle.name,
                                        unSelectedImageName: Asset.Assets.icCalendarCircle.name,
                                        expanded: true, filtrationType: .calendar, isSelected: false)
        
        let  firstItem = FiltrationModel(filterTitle: Strings.fields,
                                         selectedImageName: Asset.Assets.icFieldsCircle.name,
                                         unSelectedImageName: Asset.Assets.icFieldsCircle.name,
                                         expanded: true, filtrationType: .fields, isSelected: false)
        
        let secoundItem = FiltrationModel(filterTitle: Strings.inCenter,
                                          selectedImageName: Asset.Assets.icLocationCircleSelected.name,
                                          unSelectedImageName: Asset.Assets.icLocationCircle.name,
                                          expanded: true, filtrationType: .location, isSelected: false)
        let thirdItem = FiltrationModel(filterTitle: Strings.online,
                                        selectedImageName: Asset.Assets.icOnlineCricleSelected.name,
                                        unSelectedImageName: Asset.Assets.icOnlineCircleUnselected.name,
                                        expanded: false, filtrationType: .online, isSelected: false)
        
        return [datesItem, firstItem, secoundItem, thirdItem]
    }
}

// MARK: - Strings
//
private extension FiltrationModel {
    enum Strings {
        static let online = "Online".localized
        static let inCenter = "InCenter".localized
        static let fields = "Fields".localized
        static let calendar = "Calendar".localized
    }
}

enum FiltrationModelType {
    case online
    case fields
    case location
    case calendar
}
