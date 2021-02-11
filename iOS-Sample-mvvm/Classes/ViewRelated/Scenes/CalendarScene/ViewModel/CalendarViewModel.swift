//
//  CalendarViewModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 08/02/2021.
//

import Foundation

class CalendarViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    private var selectedDates: [Date]
    
    // MARK: - Init
    init(selectedDates: [Date]) {
        self.selectedDates = selectedDates
    }
    
    // MARK: - Handlers
    //
    
    func contain(at date: Date) -> Bool {
        selectedDates.contains(date) ? true : false
    }
    
    /// Get selected dates by user
    ///
    func getSelectedDates() -> [Date] {
        selectedDates
    }
    /// User select date
    ///
    func setSelectedDate(date: Date) {
        
        if let index = selectedDates.firstIndex(of: date) {
            selectedDates.remove(at: index)
        } else {
            selectedDates.append(date)
        }
    }
}
