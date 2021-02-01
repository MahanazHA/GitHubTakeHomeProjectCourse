//
//  GHFButton.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 5/27/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

class GFButton: UIButton { // so out button is subclass of UIButton, so since we're customizing the init, we need to "override" and call super

//first thing you need is your init method -- so we'll use the default init with the frame
    override init(frame: CGRect) {
        super.init(frame: frame) // refer to note in line 11 -- also, super calls the default init in UIButton
        configure() // calling created function that configures the UX of the button
    }
    
    
    // this initializer for when you have storyboard, and is required and has to be there
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // create our own custom initializer to make it easier to set varying parts of the button (like the color) when initializing it
    convenience init(backgroundColor: UIColor, title: String){
        // call those same things you'd call in override init
        self.init(frame: .zero) // we don't have a frame passed in like the override, so we'll set the frame to zero since autolayout will do it

        // set the stuff passed in
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    
    private func configure() { // private, therefore can only be called in the class
        layer.cornerRadius                          = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font                            = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints   = false // now, since this is in the class, anytime we use a create a GF button, it will be here (and it is necessary to have for every button when you're building UI programtically)
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
