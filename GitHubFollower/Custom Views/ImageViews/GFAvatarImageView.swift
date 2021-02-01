//
//  GFAvatarImageView.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/10/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let placeholderImage = Images.placeholder
    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true // causes the image to also have that corner radius that the view has
        image = placeholderImage! // forced unwrapped because we know its in our bundle/assets. but there could be edge cases
        translatesAutoresizingMaskIntoConstraints = false
    }
}
