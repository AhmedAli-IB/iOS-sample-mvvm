//
//  EndPoint+TargetType.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation
import Moya

extension AppEndPoints: TargetType {
    
    public var baseURL: URL { return Environment.rootURL }
    
    public var path: String {
        switch self {
        case .getSomeEndpoint:
            return AppURL.Paths.SomePath
        }
    }
    
    public var method: Moya.Method {
       switch self {
       case .getSomeEndpoint:
        return .get
        
       }
    }
    
    public var task: Task {
        switch self {
        case .getSomeEndpoint:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data { return Data() }  // We just need to return something here to fully implement the protocol
    
    public var headers: [String: String]? {
        return [KeyConstants.Headers.contentType: KeyConstants.Headers.contentTypeValue]
    }

}
