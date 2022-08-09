//
//  users.swift
//  Groupy
//
//  Created by Develop on 23/06/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation

// MARK: - User


import Foundation
struct UserModel : Codable {
    let id : String?
    let name : String?
    let phone : String?
    let email : String?
    let password : String?
    let image : String?
    let grade : String?
    let group_id : String?
    let exception : String?
    let ip_address : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case phone = "phone"
        case email = "email"
        case password = "password"
        case image = "image"
        case grade = "grade"
        case group_id = "group_id"
        case exception = "exception"
        case ip_address = "ip_address"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        grade = try values.decodeIfPresent(String.self, forKey: .grade)
        group_id = try values.decodeIfPresent(String.self, forKey: .group_id)
        exception = try values.decodeIfPresent(String.self, forKey: .exception)
        ip_address = try values.decodeIfPresent(String.self, forKey: .ip_address)
    }

}




//struct UserModel: Codable {
//    let id, name, phone, email: String
//    let password: String
//    let image: JSONNull?
//    let grade, groupID, ipAddress: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, phone, email, password, image, grade
//        case groupID = "group_id"
//        case ipAddress = "ip_address"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
