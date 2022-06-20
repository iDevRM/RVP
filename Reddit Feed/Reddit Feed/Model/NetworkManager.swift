//
//  NetworkManager.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import Foundation

class NetworkManager {
    
    let baseURL = "https://www.reddit.com/.json"
    
    func fetchData(with urlString: String? = nil, completion: @escaping (Result<[Post], Error>) -> ()) {
        
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
                    }
                    completion(.success(posts))
                    posts.removeAll()
                } catch {
                    completion(.failure(error))
                    debugPrint(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func checkForAnchor(anchor: String?) -> URL {
        let url = (anchor == nil ? baseURL : "\(baseURL)?after=\(anchor!)")
        return URL(string: url)!
    }
    
}
