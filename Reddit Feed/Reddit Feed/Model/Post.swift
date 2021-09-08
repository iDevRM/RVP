//
//  Post.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation


struct PostData: Codable {
    let data: Children
}

struct Children: Codable {
    let children: [Child]
}

struct Child: Codable {
    let data: Post
}

struct Post: Codable {
    let score: Int
    let image: String
    let title: String
    let commentCount: Int
    let imageWidth: Int?
    let imageHeight: Int?
    
    enum CodingKeys: String, CodingKey {
        case image = "thumbnail"
        case commentCount = "num_comments"
        case imageWidth = "thumbnail_width"
        case imageHeight = "thumbnail_height"
        case score, title
    }
    
}
