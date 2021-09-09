//
//  Post.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation
import SwiftUI


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
    let imageURL: String
    let title: String
    let commentCount: Int
    let imageWidth: Int?
    let imageHeight: Int?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "thumbnail"
        case commentCount = "num_comments"
        case imageWidth = "thumbnail_width"
        case imageHeight = "thumbnail_height"
        case score, title, name
    }
    
}
extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            print("Could not get image")
        }
        return UIImage()
    }
}
