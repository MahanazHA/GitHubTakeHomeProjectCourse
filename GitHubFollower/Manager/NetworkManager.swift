//
//  Network Manager.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/9/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit


// singleton
class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {
    }
    
    func getFollowers(for username: String, page: Int, closure: @escaping (Result<[Follower], GFError>) -> Void) { // sean uses "completed" instead of "closure"
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            closure(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                closure(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                closure(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                closure(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                closure(.success(followers))
            } catch {
                closure(.failure(.invalidData))
            }
            
        }
        
        task.resume() // starts the network call
    }
    
    func getUserInfo(for username: String, closure: @escaping (Result<User, GFError>) -> Void) { // sean uses "completed" instead of "closure"
        
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            closure(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                closure(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                closure(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                closure(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode(User.self, from: data)
                closure(.success(user))
            } catch {
                closure(.failure(.invalidData))
            }
            
        }
        
        task.resume() // starts the network call
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { // all you need is a unique string (well, an NSString, which is why the line of code above). because the url is unique for each image, we can just use the url
            completed(image)
            return
        } // this if let block above means that, if we have the image in the cache, then use that and return out of the function. if not, then go ahead and continue downloading it
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return // intentionally not hadnling errors, because we'll just use placeholder image instead
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self](data, response, error) in
            
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        task.resume()
    }
    
}
