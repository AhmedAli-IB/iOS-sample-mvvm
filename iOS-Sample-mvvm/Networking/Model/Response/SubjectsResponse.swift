//
//  SubjectsResponse.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 01/02/2021.
//

import Foundation

// MARK: - SubjectMainResponse
//
struct SubjectsMainResponse: Codable {
    let status: Int
    let success: Bool
    let data: [SubjectResponse]?
}

// MARK: - SubjectResponse
struct SubjectResponse: Codable {
    let id, title: String?
    let type: Int?
    let file: FileResponse?
    let interests: [InterestResponse]?
}

// MARK: - FileResponse
struct FileResponse: Codable {
    let id, path: String?
    let createdAt: Int?

    enum CodingKeys: String, CodingKey {
        case id, path
        case createdAt = "created_at"
    }
}

// MARK: - Interest
struct InterestResponse: Codable {
    let id, name: String?
    let createdAt: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
    }
}
