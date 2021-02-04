//
//  CentersResponse.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - CenterMainResponse
//
struct CenterMainResponse: Codable {
    let status: Int?
    let success: Bool?
    let data: [CenterResponse]?
    let pagination: Pagination?
}

// MARK: - CenterResponse
//
struct CenterResponse: Codable {
    let id, name: String?
    let latitude, longitude: Double?
    let address: String?
    let createdAt: Int?
    let city: City?

    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude, address
        case createdAt = "created_at"
        case city
    }
}

// MARK: - City
//
struct City: Codable {
    let id: String?
    let name: String?
    let createdAt: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
    }
}
