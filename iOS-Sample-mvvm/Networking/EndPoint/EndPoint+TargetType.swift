//
//  EndPoint+TargetType.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation
import Moya

extension AppEndPoint: TargetType {
    
    var baseURL: URL { return Environment.rootURL }
    
    var path: String {
        switch self {
        case .getSomeEndpoint:
            return "/some/path"
        }
    }
    
    var method: Moya.Method {
       switch self {
       case .getSomeEndpoint:
        return .get
        
       }
    }
    
    var task: Task {
        switch self {
        case .getSomeEndpoint:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data { return Data() }  // We just need to return something here to fully implement the protocol
    
    var headers: [String: String]? {
        return [KeyConstants.Headers.contentType: KeyConstants.Headers.contentTypeValue]
    }

}
