//
//  Subject.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Subject: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case type
    case title
  }

  var id: String?
  var type: Int?
  var title: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    type = try container.decodeIfPresent(Int.self, forKey: .type)
    title = try container.decodeIfPresent(String.self, forKey: .title)
  }

}
