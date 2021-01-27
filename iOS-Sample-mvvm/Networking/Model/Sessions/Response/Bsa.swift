//
//  Bsa.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Bsa: Codable {

  enum CodingKeys: String, CodingKey {
    case createdAt = "created_at"
    case id
  }

  var createdAt: Int?
  var id: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

}
