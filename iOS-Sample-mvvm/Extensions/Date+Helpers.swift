//
//  Date+Helpers.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/02/2021.
//

import Foundation

// MARK: - Date + Handlers
//
extension Date {
    
    /// Converte date to string with diffrent styles
    func asString(style: DateFormatter.Style,
                  formatter: DateFormatter = DateFormatter.Defaults.dateTimeFormatter) -> String {
        
        let dateFormatter = formatter
        dateFormatter.timeStyle = style
        return dateFormatter.string(from: self)
    }
    
    /// Returns time represented as `HH:mm a`.
    var humanReadableTime: String {
        let formatter = DateFormatter()
          formatter.dateFormat = "HH:mm a"

         return formatter.string(from: self)
    }
}
