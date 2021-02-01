//
//  User.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/8/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String? // since users don't have to put their real name, need to make this variable an optional
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    public let createdAt: Date
}
