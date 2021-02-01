//
//  GFFollowerItemVC.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/23/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

// subclass of GFItemInfoViewController and INHERITS all of its members
class GFFollowerItemVC: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        
        actionButton.set(backgroundColor: .systemIndigo, title: "GetFollowers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
    
}
