//
//  VideosModel.swift
//  Groupy
//
//  Created by Develop on 23/08/2022.
//  Copyright © 2022 Develop. All rights reserved.
//

import Foundation

// MARK: - VideosModel

struct VideosModel: Codable {
    let id, url, descVideo, videoListID: String
    let titleVideo: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case descVideo = "desc_video"
        case videoListID = "video_list_id"
        case titleVideo = "title_video"
    }
}
