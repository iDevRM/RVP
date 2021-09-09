//
//  NetworkManager.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    let baseURL = "https://www.reddit.com/.json"
    var hasAnchor = false
    
    func fetchData(with urlString: String?, completion: @escaping (Result<[Post], Error>) -> ()) {
        if urlString != nil {
            self.hasAnchor = true
            
        }
        
        let request = URLRequest(url: checkForAnchor(anchor: urlString))
        
        let task = URLSession.shared.dataTask(with: request) { data, respone , error in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            let decoder = JSONDecoder()
            
            if let safeData = data {
                var posts = [Post]()
                do {
                    let postData = try decoder.decode(PostData.self, from: safeData)
                    for child in postData.data.children {
                        posts.append(child.data)
                        print(child.data.imageURL)
                    }
                    completion(.success(posts))
                               
                } catch {
                    completion(.failure(error))
                    debugPrint(error.localizedDescription)
                }
            }
            
        }
        task.resume()
        
    }
    
    func checkForAnchor(anchor: String?) -> URL {
        if anchor == nil {
            if let url = URL(string: baseURL) {
                return url
            }
        } else {
            if let url = URL(string: "\(baseURL)?after=\(anchor!)") {
                return url
            }
            
        }
        return URL(string: "")!
    }
    
}
