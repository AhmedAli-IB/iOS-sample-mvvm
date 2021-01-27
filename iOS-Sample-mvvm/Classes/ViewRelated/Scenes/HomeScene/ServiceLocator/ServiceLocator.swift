//
//  Placeholder.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import Foundation

protocol HomeServiceLocatorProtocol {
    func getSessions(onCompletion: @escaping (Result<[SessionsData], Error>) -> Void)
}

class HomeServiceLocator: HomeServiceLocatorProtocol {
     
    private let  network = NetworkManager()
    
    func getSessions(onCompletion: @escaping (Result<[SessionsData], Error>) -> Void) {
        
        network.request(.getSessions) { (result: Result<SessionsResponse, Error>) in
            
            switch result {
            case .success(let data):
                
                guard  let sessionsData = data.sessionsData else {
                    onCompletion(.failure(HomeError.unableToGetSessions))
                    return
                }
                onCompletion(.success(sessionsData))
                
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}

// MARK: - Error
//
enum HomeError: Error {
    case unableToGetSessions
}
