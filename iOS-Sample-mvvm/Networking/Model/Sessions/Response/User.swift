//
//  User.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct User: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case email
    case createdAt = "created_at"
  }

  var id: String?
  var email: String?
  var createdAt: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
  }

}
