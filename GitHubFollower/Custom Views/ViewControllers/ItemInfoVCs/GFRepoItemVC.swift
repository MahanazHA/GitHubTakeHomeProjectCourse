//
//  GFRepoItemVC.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/23/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

// subclass of GFItemInfoViewController and INHERITS all of its members
class GFRepoItemVC: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        
        actionButton.set(backgroundColor: .systemTeal, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
}
