//
//  users.swift
//  Groupy
//
//  Created by Develop on 23/06/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id, name, phone, email: String
    let password: String
    let image: JSONNull?
    let grade, groupID, ipAddress: String

    enum CodingKeys: String, CodingKey {
        case id, name, phone, email, password, image, grade
        case groupID = "group_id"
        case ipAddress = "ip_address"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
