//
//  Placeholder.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    var onReload: (() -> Void)?
    var onNetworkFailure: (() -> Void)?

    private let photoServiceLocator: HomeServiceLocatorProtocol
    private var sessions: [SessionsData] = []
    
    init(photoServiceLocator: HomeServiceLocatorProtocol = HomeServiceLocator()) {
        self.photoServiceLocator = photoServiceLocator
    }
    
    var numberOfRows: Int {
        sessions.count
    }
    
    func getCurrentObject(for indexPath: IndexPath) -> SessionsData {
        return sessions[indexPath.row]
    }
    
}

extension HomeViewModel {
    
    func getSessions() {
        
        self.state.send(.loading)
        
        if !InternetChecker.isConnectedToNetwork() {
            self.onNetworkFailure?()
        }
        
        photoServiceLocator.getSessions { [weak self](result) in
            
            guard let self = self else { return }
            switch result {
            case .success(let sessions):
               
                self.sessions = sessions
                self.onReload?()
                self.state.send(.success)
                
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
}
