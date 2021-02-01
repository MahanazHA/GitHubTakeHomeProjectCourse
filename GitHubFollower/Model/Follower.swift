//
//  Follower.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/8/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable { // when you use codable, your variable names have to match whats in the data structures (except you can change to camelCase if needed bc codable can automatically convert that or whatever)
    
    // important to make certain variables as optional in case the value is nul
    
    var login: String
    var avatarUrl: String
}
