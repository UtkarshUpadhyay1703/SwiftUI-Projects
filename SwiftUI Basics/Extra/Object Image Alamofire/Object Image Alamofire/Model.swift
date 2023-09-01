//
//  Model.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

import Foundation

struct Model: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

