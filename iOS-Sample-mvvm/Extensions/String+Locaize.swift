//
//  String+Locaize.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 22/02/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
