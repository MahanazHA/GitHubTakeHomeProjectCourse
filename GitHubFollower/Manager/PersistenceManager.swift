//
//  PersistenceManager.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 11/29/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
    
}

enum PersistenceManager { // can't init empty enum, but can for struct. Therefore for safety, making enum and not struct
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login } // goes through all favorites and removes all instances of it
                }
                // save array back into user defaults
                completed(save(favorites: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    // Hello Ammu, I like potatoes
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) { // completion handler
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError?{
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil // no error
        } catch {
            return .unableToFavorite
        }
    }
} 
