//
//  ProfileViewController.swift
//  IntroToTestingApp
//
//  Created by Chase Wang on 2/7/17.
//  Copyright © 2017 ocwang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModel!
    
    // MARK: - Subviews
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var isUsernamePalindrome: UILabel!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullNameLabel.text = viewModel.user.fullName
        self.usernameLabel.text = viewModel.user.username
        self.lastSeenLabel.text = "Last Seen: \(viewModel.format(timeInterval: viewModel.user.lastActive))"
        self.isUsernamePalindrome.text = viewModel.isUsernamePalindrome() ? "Yes" : "No"
    }
}
