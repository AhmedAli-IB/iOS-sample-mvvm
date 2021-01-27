//
//  KeyConstants.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation

struct KeyConstants {
    
    static let DeviceType = "iOS"
    
    static let token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"
        + ".eyJpc3MiOiJodHRwczpcL1wvc21lYS1wYy5pYnRpa2FyLnNhXC9hcGlcL2"
        + "F1dGhlbnRpY2F0aW9uXC9zbWVcL2xvZ2luIiwiaWF0IjoxNjA5ODYwMjQzLCJleH"
        + "AiOjE3Njc2NjAyNDMsIm5iZiI6MTYwOTg2MDI0MywianRpIjoiYkhSVGVPaExhN0"
        + "hVanRWeSIsInN1YiI6IjY3ODhmOTQ3LWZmZWItNDQ5My1iMmMyLTMwZWJlODM0MmNmMyIs"
        + "InBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEif"
        + "Q.IY-ZqTYso27L7w58bH2sT5xSCVZvkdNw0Y2lIroRI94"
    
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
