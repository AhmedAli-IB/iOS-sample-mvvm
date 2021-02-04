////
////  File.swift
////
////  Created by Aya Essam on 27/01/2021
////  Copyright (c) . All rights reserved.
////
//
//import Foundation
//
//struct File: Codable {
//
//  enum CodingKeys: String, CodingKey {
//    case createdAt = "created_at"
//    case path
//    case id
//  }
//
//  var createdAt: Int?
//  var path: String?
//  var id: String?
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
//    path = try container.decodeIfPresent(String.self, forKey: .path)
//    id = try container.decodeIfPresent(String.self, forKey: .id)
//  }
//
//}
