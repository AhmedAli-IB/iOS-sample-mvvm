//
//  Enviroment.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 18/01/2021.
//

import Foundation

public enum Environment {
    // MARK: - Keys

    enum PlistKeys {
        static let rootURL = "SERVER_URL"
        static let apiKey = "API_KEY"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    // MARK: - Plist values
    //
    /// Server URL
    ///
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[PlistKeys.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment \(#function)")
        }
        let baseUrl = "https://\(rootURLstring)"
        guard let url = URL(string: baseUrl ) else {
            fatalError("Root URL is invalid")
        }
        print("url version", url.absoluteString )
        return url
    }()
    
    static let rootURLString: String = {
        guard let rootURLstring = Environment.infoDictionary[PlistKeys.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment \(#function)")
        }
        return "https://\(rootURLstring)"
    }()
    /// api key
    ///
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[PlistKeys.apiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
