//
//  videoListsModel.swift
//  Groupy
//
//  Created by Develop on 21/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation

// MARK: - ListVideoModel
struct VideoListsModel: Codable {
    let id, grade, listName, listDetails: String

    enum CodingKeys: String, CodingKey {
        case id, grade
        case listName = "list_name"
        case listDetails = "list_details"
    }
}




