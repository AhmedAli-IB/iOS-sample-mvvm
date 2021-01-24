//
//  State.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

// MARK: -  State
/// state enum show current state of request call success, faliure and loading
///
public enum State<Success> {

    /// A success, storing a `Success` value.
    case success

    /// A failure, storing a `Error` value.
    case failure(String)

    /// A loading, indicates when loading starts
    case loading
    
}

extension State: Equatable {
    
    public static func == (lhs: State<Success>, rhs: State<Success>) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure, .failure):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    
}
