//
//  KeyConstants.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation

struct KeyConstants {
    
    static let DeviceType = "iOS"
    
    struct UserDefaults {
        static let userRunningAppFirstTime = "userRunningAppFirstTime"
    }
    
    struct Headers {
        static let apiKey = "X-Api-Key"
        static let apiValue = ""
        static let lang = "Accept-Language"
        static let authorization = "Authorization"
        static let contentType = "Content-type"
        static let contentTypeValue = "application/json"
        static let encoding = "Accept-Encoding"
        static let encodingValue = "application/json"
    }
}

