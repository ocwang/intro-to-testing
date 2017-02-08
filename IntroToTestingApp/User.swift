//
//  User.swift
//  IntroToTestingApp
//
//  Created by Chase Wang on 2/7/17.
//  Copyright © 2017 ocwang. All rights reserved.
//

import Foundation

class User {
    
    // MARK: - Instance Vars
    
    let username: String
    let fullName: String
    let lastActive: TimeInterval
    
    // MARK: - Init
    
    init(username: String, fullName: String, lastActive: TimeInterval) {
        self.username = username
        self.fullName = fullName
        self.lastActive = lastActive
    }
}
