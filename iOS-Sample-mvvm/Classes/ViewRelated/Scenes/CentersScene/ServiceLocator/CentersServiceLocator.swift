//
//  CentersServiceLocator.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation
// MARK: - CentersServiceLocatorProtocol
//
protocol CentersServiceLocatorProtocol {
    func getCenters(onCompletion: @escaping (Result<[CenterModel], Error>) -> Void)
}
// MARK: - FieldsServiceLocator
//
class CentersServiceLocator: CentersServiceLocatorProtocol {
    
    // MARK: - Properties
    //
    let network = NetworkManager()
    // MARK: - Handlers
    //
    func getCenters(onCompletion: @escaping (Result<[CenterModel], Error>) -> Void) {
        network.request(.getCenters) { (result: Result<CenterMainResponse, Error>) in
            switch result {
            
            case .success(let response):
                guard let centerResponse = response.data  else {
                    return
                }
                /// Verify th e transformation of response  to `CenterModel` object
                ///
                var centers: [CenterModel]  = []
                centerResponse.forEach {
                    guard let  center = CenterModel(center: $0) else { return }
                    centers.append(center)
                }
                onCompletion(.success(centers))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
