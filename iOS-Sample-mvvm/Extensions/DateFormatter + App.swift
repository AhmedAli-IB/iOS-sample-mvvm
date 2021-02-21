//
//  DateFormatter + App.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 21/02/2021.
//

import Foundation

/// DateFormatter Extensions
///
public extension DateFormatter {
    
    /// Default Formatters
    ///
    struct Defaults {
        
        /// Date And Time Formatter
        ///
        public static let dateTimeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "MM-dd-YYYY at h:mm a"
            return formatter
        }()
        
        /// Date  Formatter  for history request paramters start and end date
        ///
        public static let arabicFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = NSLocale(localeIdentifier: "ar_DZ") as Locale
            formatter.dateFormat = "EEEE, d, MMMM"
            return formatter
        }()
    }
    
}
