//
//  SsoUser.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SsoUser: Codable {

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case user
    case mobileNumber = "mobile_number"
    case fullName = "full_name"
    case nationalIdentity = "national_identity"
    case gender
    case id
  }

  var createdAt: Int?
  var user: User?
  var mobileNumber: String?
  var fullName: String?
  var nationalIdentity: String?
  var gender: Int?
  var id: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
    user = try container.decodeIfPresent(User.self, forKey: .user)
    mobileNumber = try container.decodeIfPresent(String.self, forKey: .mobileNumber)
    fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
    nationalIdentity = try container.decodeIfPresent(String.self, forKey: .nationalIdentity)
    gender = try container.decodeIfPresent(Int.self, forKey: .gender)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

}
