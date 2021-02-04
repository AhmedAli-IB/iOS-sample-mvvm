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
    func getContributors(contributorRequest: ContributorRequest,
                         onCompletion: @escaping (Result<[Contributor], Error>) -> Void)
}

class SearchServiceLocator: SearchServiceLocatorProtocol {
    
    typealias ContributorsCompletion = (Result<[Contributor], Error>) -> Void
    
    // MARK: - Properties
    //
    private let  network = NetworkManager()
    /// Get contributors from remot server
    /// - Parameters:
    ///   - text: What you search for's
    func getContributors(contributorRequest: ContributorRequest,
                         onCompletion: @escaping ContributorsCompletion) {
        network.request(.getContributors(contributorRequest)) { (result: Result<ContributorsMainResponse, Error>) in
            switch result {
            case .success(let data):
                guard let contributorsResponse = data.data  else {
                    return
                }
                /// Verify th e transformation of response  to contributor object
                ///
                var contributors: [Contributor]  = []
                contributorsResponse.forEach {
                    guard let contributor = Contributor(contributor: $0) else { return }
                    contributors.append(contributor)
                }
                
                onCompletion(.success(contributors))
                
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }

    }

}
