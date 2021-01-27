//
//  Contributor.swift
//
//  Created by Aya Essam on 27/01/2021
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Contributor: Codable {

  enum CodingKeys: String, CodingKey {
    case isAvailable = "is_available"
    case id
    case ssoUser = "sso_user"
    case aboutMe = "about_me"
    case file
    case isOnline = "is_online"
    case createdAt = "created_at"
    case availability
    case joinNowEnabled = "join_now_enabled"
    case subscribersCount = "subscribers_count"
    case onlineEnabled = "online_enabled"
    case subject
//    case interests Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc21lYS1wYy5pYnRpa2FyLnNhXC9hcGlcL2F1dGhlbnRpY2F0aW9uXC9zbWVcL2xvZ2luIiwiaWF0IjoxNjA5ODYwMjQzLCJleHAiOjE3Njc2NjAyNDMsIm5iZiI6MTYwOTg2MDI0MywianRpIjoiYkhSVGVPaExhN0hVanRWeSIsInN1YiI6IjY3ODhmOTQ3LWZmZWItNDQ5My1iMmMyLTMwZWJlODM0MmNmMyIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.IY-ZqTYso27L7w58bH2sT5xSCVZvkdNw0Y2lIroRI94
    case bsa
    case zoom
    case chatStatus = "chat_status"
    case isSubscribed = "is_subscribed"
    case rating
  }

  var isAvailable: Bool?
  var id: String?
  var ssoUser: SsoUser?
  var aboutMe: String?
  var file: File?
  var isOnline: Bool?
  var createdAt: Int?
  var availability: Int?
  var joinNowEnabled: Bool?
  var subscribersCount: Int?
  var onlineEnabled: Bool?
  var subject: Subject?
//  var interests: Any?
  var bsa: Bsa?
  var zoom: Zoom?
  var chatStatus: Bool?
  var isSubscribed: Bool?
  var rating: Float?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isAvailable = try container.decodeIfPresent(Bool.self, forKey: .isAvailable)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    ssoUser = try container.decodeIfPresent(SsoUser.self, forKey: .ssoUser)
    aboutMe = try container.decodeIfPresent(String.self, forKey: .aboutMe)
    file = try container.decodeIfPresent(File.self, forKey: .file)
    isOnline = try container.decodeIfPresent(Bool.self, forKey: .isOnline)
    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
    availability = try container.decodeIfPresent(Int.self, forKey: .availability)
    joinNowEnabled = try container.decodeIfPresent(Bool.self, forKey: .joinNowEnabled)
    subscribersCount = try container.decodeIfPresent(Int.self, forKey: .subscribersCount)
    onlineEnabled = try container.decodeIfPresent(Bool.self, forKey: .onlineEnabled)
    subject = try container.decodeIfPresent(Subject.self, forKey: .subject)
//    interests = try container.decodeIfPresent([].self, forKey: .interests)
    bsa = try container.decodeIfPresent(Bsa.self, forKey: .bsa)
    zoom = try container.decodeIfPresent(Zoom.self, forKey: .zoom)
    chatStatus = try container.decodeIfPresent(Bool.self, forKey: .chatStatus)
    isSubscribed = try container.decodeIfPresent(Bool.self, forKey: .isSubscribed)
    rating = try container.decodeIfPresent(Float.self, forKey: .rating)
  }

}
