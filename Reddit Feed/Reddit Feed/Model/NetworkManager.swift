//
//  NetworkManager.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation

struct NetworkManager {
    
    let url = URL(string: "https://www.reddit.com/.json")
    
    
    func fetchData(completion: @escaping (Result<[Post], Error>) -> ()) {
        guard url != nil else { return }
        
        let request = URLRequest(url: url!)
        
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
                    }
                    completion(.success(posts))
                               
                } catch {
                    completion(.failure(error))
                    debugPrint(error.localizedDescription)
                }
            }
            
        }
        .resume()
        
    }
    
}
