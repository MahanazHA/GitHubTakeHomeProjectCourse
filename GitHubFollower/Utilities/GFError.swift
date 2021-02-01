//
//  GFError.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/16/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import Foundation

enum GFError: String, Error { // string is the raw value (not associated value). For more info look in apple documentation
    // above means that it has a raw value of a string, and it does conform to swift's Error type
    
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "Wasn't able to add user to favorites. Please try again."
    case alreadyInFavorites = "This user has already been added to favorites!"
}
