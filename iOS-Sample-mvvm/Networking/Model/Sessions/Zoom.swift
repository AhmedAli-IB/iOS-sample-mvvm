////
////  Zoom.swift
////
////  Created by Aya Essam on 27/01/2021
////  Copyright (c) . All rights reserved.
////
//
//import Foundation
//
//struct Zoom: Codable {
//
//  enum CodingKeys: String, CodingKey {
//    case email
//    case createdAt = "created_at"
//    case id
//    case pid
//    case meetingPassword = "meeting_password"
//  }
//
//  var email: String?
//  var createdAt: Int?
//  var id: String?
//  var pid: String?
//  var meetingPassword: String?
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    email = try container.decodeIfPresent(String.self, forKey: .email)
//    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
//    id = try container.decodeIfPresent(String.self, forKey: .id)
//    pid = try container.decodeIfPresent(String.self, forKey: .pid)
//    meetingPassword = try container.decodeIfPresent(String.self, forKey: .meetingPassword)
//  }
//
//}
