//
//  UIViewController+Ext.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 8/7/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit
import SafariServices



extension UIViewController {
    
    // present means modal || its alerts are on background thread and its illegal to present a UI element from the background thread. So we don't have to wrap it every time or whatever to pull it on the main thread.
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        //now we're going to wrap this to put it on the main thread
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let SafariVC = SFSafariViewController(url: url)
        SafariVC.preferredControlTintColor = .systemIndigo
        present(SafariVC, animated: true)
    }
    
}
