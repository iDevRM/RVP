//
//  FeedViewModel.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation
import SwiftUI


class FeedViewModel: ObservableObject {
    
    @Published var feedPosts = [Post]()
    
    private let networkManager = NetworkManager()
    
    func getPosts() {
        networkManager.fetchData(with: nil) { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.feedPosts = posts
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func getPostsAfterAnchor(anchor: String) {
        networkManager.fetchData(with: anchor) { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.feedPosts += posts
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
