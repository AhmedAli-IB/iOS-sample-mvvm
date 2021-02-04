//
//  NetworkManger.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation
import Moya

class NetworkManager {
    
    // MARK: - Properties
    
    /// Network provider
    ///
    lazy private var provider = MoyaProvider<AppEndPoint>(
        plugins: [loggingPlugin]
    )
    
    func request<T: Codable>(_ target: AppEndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        
        provider.request(target) { result in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: response.data)
                        completion(.success(apiResponse))
                    } catch {
                        print(error)
                        completion(.failure(NetworkError.parseError))
                    }
                } else {
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError))
                    } catch {
                        completion(.failure(NetworkError.parseError))
                    }
                }
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError))
            }
            
        }
    }
}
// MARK: - Helpers
//
private extension NetworkManager {
    
    // MARK: - Properties
    /// logging for request and response body
    ///
    var loggingPlugin: NetworkLoggerPlugin {
        NetworkLoggerPlugin(
            configuration: .init(logOptions: .verbose)
        )
    }
}
