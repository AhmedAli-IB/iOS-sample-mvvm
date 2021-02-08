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
    private var selectedDates: [TimeInterval]
    
    // MARK: - Init
    init(selectedDates: [TimeInterval]) {
        self.selectedDates = selectedDates
    }
    
    // MARK: - Handlers
    //
    
    func contain(at date: TimeInterval) -> Bool {
        selectedDates.contains(date) ? true : false
    }
    
    /// Get selected dates by user
    ///
    func getSelectedDates() -> [TimeInterval] {
        selectedDates
    }
    /// User select date
    ///
    func setSelectedDate(date: TimeInterval) {
        
        if let index = selectedDates.firstIndex(of: date) {
            selectedDates.remove(at: index)
        } else {
            selectedDates.append(date)
        }
    }
}
