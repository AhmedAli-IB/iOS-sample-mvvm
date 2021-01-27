//
//  SessionsData.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SessionsData: Codable {

  enum CodingKeys: String, CodingKey {
    case type
    case purpose
    case met
    case contributorRated = "contributor_rated"
    case reviewed
    case hint
    case canStart = "can_start"
    case actualStart = "actual_start"
    case schedule
    case ratedBefore = "rated_before"
    case resumable
    case createdAt = "created_at"
    case smeRated = "sme_rated"
    case id
    case status
    case actualEnd = "actual_end"
    case contributorJoined = "contributor_joined"
    case smeJoined = "sme_joined"
    case canBeRated = "can_be_rated"
  }

  var type: Int?
  var purpose: String?
  var met: Bool?
  var contributorRated: Bool?
  var reviewed: Bool?
  var hint: String?
  var canStart: Bool?
  var actualStart: Int?
  var schedule: Schedule?
  var ratedBefore: Bool?
  var resumable: Bool?
  var createdAt: Int?
  var smeRated: Bool?
  var id: String?
  var status: Int?
  var actualEnd: Int?
  var contributorJoined: Bool?
  var smeJoined: Bool?
  var canBeRated: Bool?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(Int.self, forKey: .type)
    purpose = try container.decodeIfPresent(String.self, forKey: .purpose)
    met = try container.decodeIfPresent(Bool.self, forKey: .met)
    contributorRated = try container.decodeIfPresent(Bool.self, forKey: .contributorRated)
    reviewed = try container.decodeIfPresent(Bool.self, forKey: .reviewed)
    hint = try container.decodeIfPresent(String.self, forKey: .hint)
    canStart = try container.decodeIfPresent(Bool.self, forKey: .canStart)
    actualStart = try container.decodeIfPresent(Int.self, forKey: .actualStart)
    schedule = try container.decodeIfPresent(Schedule.self, forKey: .schedule)
    ratedBefore = try container.decodeIfPresent(Bool.self, forKey: .ratedBefore)
    resumable = try container.decodeIfPresent(Bool.self, forKey: .resumable)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
    smeRated = try container.decodeIfPresent(Bool.self, forKey: .smeRated)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    status = try container.decodeIfPresent(Int.self, forKey: .status)
    actualEnd = try container.decodeIfPresent(Int.self, forKey: .actualEnd)
    contributorJoined = try container.decodeIfPresent(Bool.self, forKey: .contributorJoined)
    smeJoined = try container.decodeIfPresent(Bool.self, forKey: .smeJoined)
    canBeRated = try container.decodeIfPresent(Bool.self, forKey: .canBeRated)
  }

}
