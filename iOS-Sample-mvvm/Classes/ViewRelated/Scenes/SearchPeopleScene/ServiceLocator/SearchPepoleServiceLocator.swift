//
//  SearchPepoleServiceLocator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import Foundation

// MARK: - Search ServiceLocator Protocol
//
protocol SearchServiceLocatorProtocol {
    func getContributors(onCompletion: @escaping (Result<[Contributor], Error>) -> Void)
}

class SearchServiceLocator: SearchServiceLocatorProtocol {
    
    typealias ContributorsCompletion = (Result<[Contributor], Error>) -> Void
    
    // MARK: - Properties
    //
    private let  network = NetworkManager()
    /// get
    ///
    func getContributors(onCompletion: @escaping ContributorsCompletion) {
        let request = ContributorRequest()
        network.request(.getContributors(request)) { (result: Result<ContributorsMainResponse, Error>) in
            switch result {
            
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }

    }

}
