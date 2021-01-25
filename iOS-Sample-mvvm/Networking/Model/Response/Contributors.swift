//
//  Contributors.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 25/01/2021.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contributors = try? newJSONDecoder().decode(Contributors.self, from: jsonData)

// MARK: - Contributors
struct Contributorssss: Codable {
    let status: Int
    let success: Bool
    let data: [Datum]
    let pagination: Pagination
}

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let rating: Double
    let availability: Int
    let onlineEnabled: Bool
    let aboutMe: String?
    let isAvailable, joinNowEnabled, chatStatus, isOnline: Bool
    let createdAt: Int
    let isSubscribed: Bool
    let subscribersCount: Int
    let ssoUser: SsoUser
    let subject: Subject
    let consultant: Consultant?
    let advisor: Advisor?
    let zoom: Zoom?
    let office: Interest?
    let interests: [Interest]
    let file: File?

    enum CodingKeys: String, CodingKey {
        case id, rating, availability
        case onlineEnabled = "online_enabled"
        case aboutMe = "about_me"
        case isAvailable = "is_available"
        case joinNowEnabled = "join_now_enabled"
        case chatStatus = "chat_status"
        case isOnline = "is_online"
        case createdAt = "created_at"
        case isSubscribed = "is_subscribed"
        case subscribersCount = "subscribers_count"
        case ssoUser = "sso_user"
        case subject, consultant, advisor, zoom, office, interests, file
    }
}

// MARK: - Advisor
struct Advisor: Codable {
    let id: String
    let creationDate: Int

    enum CodingKeys: String, CodingKey {
        case id
        case creationDate = "creation_date"
    }
}

// MARK: - Consultant
struct Consultant: Codable {
    let id: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
    }
}

// MARK: - File
struct File: Codable {
    let id, path: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case id, path
        case createdAt = "created_at"
    }
}

// MARK: - Center
struct Center: Codable {
    let id, name: String
    let latitude, longitude: Double
    let address: String
    let createdAt: Int
    let city: Interest

    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude, address
        case createdAt = "created_at"
        case city
    }
}

// MARK: - Interest
class Interest: Codable {
    let id, name: String
    let createdAt: Int
    let center: Center?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case center
    }

    init(id: String, name: String, createdAt: Int, center: Center?) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.center = center
    }
}

// MARK: - SsoUser
struct SsoUser: Codable {
    let id, nationalIdentity, fullName: String
    let mobileNumber: String?
    let gender, createdAt: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case nationalIdentity = "national_identity"
        case fullName = "full_name"
        case mobileNumber = "mobile_number"
        case gender
        case createdAt = "created_at"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id, email: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case id, email
        case createdAt = "created_at"
    }
}

// MARK: - Subject
struct Subject: Codable {
    let id, title: String
    let type: Int
    let file: File?
}

// MARK: - Zoom
struct Zoom: Codable {
    let id, email, meetingPassword, pid: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case id, email
        case meetingPassword = "meeting_password"
        case pid
        case createdAt = "created_at"
    }
}

// MARK: - Pagination
//
struct Pagination: Codable {
    let count, total, perPage, currentPage: Int
    let totalPages: Int
}
