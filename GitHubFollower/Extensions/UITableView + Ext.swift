//
//  UITableView + Ext.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 12/17/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

extension UITableView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
