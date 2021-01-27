//
//  Schedule.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Schedule: Codable {

  enum CodingKeys: String, CodingKey {
    case contributor
    case createdAt = "created_at"
    case status
    case startDate = "start_date"
    case communicationWay = "communication_way"
    case id
    case endDate = "end_date"
  }

  var contributor: Contributor?
  var createdAt: Int?
  var status: Int?
  var startDate: Int?
  var communicationWay: Int?
  var id: String?
  var endDate: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    contributor = try container.decodeIfPresent(Contributor.self, forKey: .contributor)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    startDate = try container.decodeIfPresent(Int.self, forKey: .startDate)
    communicationWay = try container.decodeIfPresent(Int.self, forKey: .communicationWay)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    endDate = try container.decodeIfPresent(Int.self, forKey: .endDate)
  }

}
