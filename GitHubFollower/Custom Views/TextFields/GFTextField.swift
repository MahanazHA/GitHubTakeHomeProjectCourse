//
//  GFTextField.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 5/31/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false // remember this is necessary for programmatic UI
        
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor // for border color, you need to use CG colors (and refer to UIColor) which looks like this
        
        textColor                   = .label // label is like a standard color
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true // so if user puts in a really long amount of text, it adjusts the font size to accomodate the width
        minimumFontSize             = 12 // and then we set the minimum so that the above line of code doesn't get TOO small
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no // turns autocorrect off for this text field
        returnKeyType               = .go
        clearButtonMode             = .whileEditing
        placeholder                 = "Enter a username"
    }

}
