//
//  GFTabBarController.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 11/30/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemIndigo
        viewControllers                 = [createSearchNC(), createFavoritesNC()]
    }
    
    // These functions are being created to refactor the code (and the parts that it refactors will be commented out)
    func createSearchNC() -> UINavigationController {
        
        let searchVC        = SearchViewController() // creates a view controller set to the [root] VC
        searchVC.title      = "Search" // set the title
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0) // create the tab bar item, set the image to the default search image, and set it to 0 in the array of tabBarItems (tag)
        
        return UINavigationController(rootViewController: searchVC) // return the proper UINC with the created VC as the root VC
    }
    
    func createFavoritesNC() -> UINavigationController {
        
        let favoritesVC         = FavoritesListViewController()
        favoritesVC.title       = "Favorites"
        favoritesVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1) // this time tag is 1 as second item in tab bar (where search is first)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}
