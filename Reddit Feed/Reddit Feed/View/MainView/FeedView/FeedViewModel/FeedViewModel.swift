//
//  FeedViewModel.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation
import SwiftUI


class FeedViewModel: ObservableObject {
    
    @Published var postFeed = [Post]()
    private let networkManager = NetworkManager()
    
    init() {
        getPosts()
    }
    
    private func getPosts() {
        networkManager.fetchData() { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.postFeed = posts
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func postIsAnchor(_ post: Post ) -> Bool  {
        if let lastID = postFeed.last?.id {
            return lastID == post.id
        }
        return false
    }
    
    func getPostsAfter(anchor: String) {
        networkManager.fetchData(with: anchor) { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.postFeed += posts
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
