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
        case .getContributors:
            return "/api/profile/contributors"
        case .getSubjects:
            return "/api/dashboard/mobile/subjects"
        }
    }
    
    var method: Moya.Method {
       switch self {
       case .getContributors:
        return .get
        
       case .getSubjects:
        return .get
       }
    }
    
    var task: Task {
        switch self {
        case .getContributors(let request):
            let parameters = (try? request.asDictionary()) ?? [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getSubjects:
            return .requestPlain
        }
    }
    
    var sampleData: Data { return Data() }  // We just need to return something here to fully implement the protocol
    
    var headers: [String: String]? {
        return [KeyConstants.Headers.contentType: KeyConstants.Headers.contentTypeValue]
    }

}
