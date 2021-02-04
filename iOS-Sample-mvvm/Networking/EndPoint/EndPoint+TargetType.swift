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
        case .getSessions:
            return "/api/schedule/sme/sessions"
        case .getContributors:
            return "/api/profile/contributors"
        case .getSubjects:
            return "/api/dashboard/mobile/subjects"
        case .getCenters:
            return "/api/center/centers"
        }
    }
    
    var method: Moya.Method {
       switch self {
       case .getSessions:
        return .get
       case .getContributors:
        return .get
       case .getSubjects:
        return .get
       case .getCenters:
        return .get
       }
    }
    
    var task: Task {
        switch self {
        case .getSessions:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getContributors(let request):
            let parameters = (try? request.asDictionary()) ?? [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getSubjects:
            return .requestPlain
            
        case .getCenters:
            return .requestPlain
        }
    }
    
    var sampleData: Data { return Data() }  // We just need to return something here to fully implement the protocol
    
    var headers: [String: String]? {
        return [KeyConstants.Headers.contentType: KeyConstants.Headers.contentTypeValue,
                KeyConstants.Headers.authorization: KeyConstants.token]
    }

}
