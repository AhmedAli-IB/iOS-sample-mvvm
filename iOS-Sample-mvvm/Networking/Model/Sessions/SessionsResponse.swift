//
//  SessionsResponse.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SessionsResponse: Codable {

  enum CodingKeys: String, CodingKey {
    case status
    case success
    case sessionsData = "data"
  }

  var status: Int?
  var success: Bool?
  var sessionsData: [SessionsData]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    success = try container.decodeIfPresent(Bool.self, forKey: .success)
    sessionsData = try container.decodeIfPresent([SessionsData].self, forKey: .sessionsData)
  }

}
