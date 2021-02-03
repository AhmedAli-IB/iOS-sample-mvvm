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
    let file: File?
    let interests: [Interest]?
}


