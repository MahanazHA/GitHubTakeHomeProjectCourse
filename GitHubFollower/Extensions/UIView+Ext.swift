//
//  UIView+Ext.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 12/15/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...){ // ... allows you to add any number of views into parameter, and turns that into an array that you can cycle through
        for view in views {
            addSubview(view)
        }
    }
}
