//
//  File.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation

enum `Type`:String, Codable {
    case business
    case system
    case mapping
}

// MARK: - Network Error
//

struct NetworkError: Codable, Error {
   
    var code: Int?
    var message: String?
    var type: Type?
    
    // MARK: - Init
    //
    init () {}
    
    init(error: MoyaError) {
        self.code = error.errorCode
        self.message = error.errorDescription

        switch error {
        case .underlying:
            self.type = .system
        default :
            self.type = .mapping
        }
    }
}

// MARK: - NetworkError
/// Handle Mapping Error
///
extension NetworkError {
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        error.message = "We could not decode the response."
        return error
    }()
}

// MARK: - Localized Description
extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        return self.message
       }
}
