//
//  GFItemInfoView.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/22/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, following, followers
}

class GFItemInfoView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubviews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill // since we're using different shaped SFSymbols, we want to do this so that they all look generally consistent
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos // system name specifically refers to SFSymbols, whereas named means an asset
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = SFSymbols.gists // system name specifically refers to SFSymbols, whereas named means an asset
            titleLabel.text = "Public Gists"
        case .following:
            symbolImageView.image = SFSymbols.following // system name specifically refers to SFSymbols, whereas named means an asset
            titleLabel.text = "Following"
        case .followers:
            symbolImageView.image = SFSymbols.followers // system name specifically refers to SFSymbols, whereas named means an asset
            titleLabel.text = "Followers"
        }
        countLabel.text = String(count)
    }
}
