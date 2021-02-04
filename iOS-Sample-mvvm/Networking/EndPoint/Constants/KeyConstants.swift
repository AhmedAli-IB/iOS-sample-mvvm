//
//  KeyConstants.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation

struct KeyConstants {
    
    static let DeviceType = "iOS"
    
    static let token = "Bearer " +
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ" +
        "9" +
        ".eyJpc3MiOiJodHRwczpcL1wvZGVtby1zbWVhLmlidGlrYXIuc2F" +
        "cL2FwaVwvYXV0aGVudGljYXRpb25cL3NtZVwvbG9naW4iLCJpYXQiOj" +
        "E2MTIzNDUwOTMsImV4cCI6MTc3MDE0NTA5MywibmJmIjoxNjEyMzQ1MDkzL" +
        "CJqdGkiOiJ0S0R4VURSSlpYMnpNMVEzIiwic3ViIjoiNTVjMjExMTgtZDdlYi00Ym" +
        "I3LThjN2MtYTMwYzZiZjQ4OGVkIiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVj" +
        "OTcxNTNhMTRlMGIwNDc1NDZhYSJ9.x8l7VD1jx-pwNNtWse2y37NX2qPcyQo9HobsVRyiQC8"
    
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
