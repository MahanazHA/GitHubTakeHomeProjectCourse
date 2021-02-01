//
//  SearchViewController.swift
//  GitHubFollower
//
//  Created by Mahanaz Atiqullah on 5/25/20.
//  Copyright © 2020 Mahanaz Atiqullah. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let logoImageView       = UIImageView()
    let userNameTextField   = GFTextField()
    let callToActionButton  = GFButton(backgroundColor: .systemIndigo, title: "Get Followers") // this is the Get Followers button, and is given a more general name in case the button title were to change
    
    var isUsernameEntered: Bool {
        return !userNameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // adaptable -- makes white for light mode and black for dark mode
        // Do any additional setup after loading the view.
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    // we are hiding the nav bar in willappear and NOT didload because, even though in didload it will initially be hidden, if you hit back, it'll be there again, so willappear will always have it hidden
    override func viewWillAppear(_ animated: Bool) { // to make the nav bar not appear for this particular scene
        super.viewWillAppear(animated) // call super
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureLogoImageView()
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView) // this is what puts it on, and none of the configuration actually even appears until you have this code -- this code is the equivalent of dragging and dropping an image view onto a subview
        logoImageView.translatesAutoresizingMaskIntoConstraints = false // that "essential" line of code that has it use autolayout. Needs to be mentioned here, but won't need to be mentioned for the objects since its already in there
        logoImageView.image = Images.ghLogo // "stringly typed" (name given in community) is generally dangerous
        
        
        //doing the constraints programmatically -- efficient way is to activate, and then put an array of constraints
        NSLayoutConstraint.activate([
            // image view constraints
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), // don't forget the comma! (it's an array)
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200) // Sean said that square images are so much easier to work with
            
        
        ]) 
    }
    
    func configureTextField(){
        
        view.addSubview(userNameTextField)
        
        // set the delegate
        userNameTextField.delegate = self // (self refers to the SearchViewController)
        
        // since we've already done the configuration of the text field in GFTextField, we can jump straight to constraints
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48), // y-coordinate is pinned to the bottom of the logo image view
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), // x-coord part 1
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // x-coord part 2
            userNameTextField.heightAnchor.constraint(equalToConstant: 50) // height
        ])
        
    }
    
    func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside) // means that whenever we tap the button, pushFollowerListVC is going to be called)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), // trailing/bottom use negative numbers
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // SETTING UP THE KEYBOARD STUFF
    
    func createDismissKeyboardTapGesture(){
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    // PASSING DATA
    
    @objc func pushFollowerListVC() { // whenever you have a #selector, you need to have @objc because #selector is remenent of obj-c and you need to expose the function to objective c
        
        guard isUsernameEntered else { // if true, keep going. if not, do what's in else
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username!", buttonTitle: "Ok")
            return
        }
        
        userNameTextField.resignFirstResponder() // makes keyboard go away so when you come back its not automaically there
        
        let followerListVC = FollowerListViewController(username: userNameTextField.text!)
        navigationController?.pushViewController(followerListVC, animated: true)
    }

}

// sean likes to conform to delegates in extensions
extension SearchViewController: UITextFieldDelegate {
    // when you conform to a delegate, you're sitting there listening, and you have to tell the view controller what to listen to. In this case, we want it to listen to the user name text field (like when the return key gets entered) AND THEREFORE in our configure text field, we have to set the delegate (which basically means "listen to me")
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
     
}
