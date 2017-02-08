//
//  ITTViewModel.swift
//  IntroToTestingApp
//
//  Created by Chase Wang on 2/7/17.
//  Copyright © 2017 ocwang. All rights reserved.
//

import UIKit

class ProfileViewModel {
    
    // MARK: - Instance Vars
    
    let user: User
    
    // MARK: - Init
    
    init(user: User) {
        self.user = user
    }
    
    // MARK: -
    
    func isUsernamePalindrome() -> Bool {
        return user.username == String(user.username.characters.reversed())
    }
    
    func format(timeInterval: TimeInterval) -> String {
        let components = intervalComponents(from: timeInterval)
        
        switch components {
        case (0, 0, 0):                                 return "0s ago"
        case (0, 0, let seconds):                       return String(format: "%ds ago", seconds)
        case (0, let minutes, let seconds):             return String(format: "%dm %ds ago", minutes, seconds)
        case (let hours, let minutes, let seconds):     return String(format: "%dh %dm %ds ago", hours, minutes, seconds)
        }
    }
    
    private func intervalComponents(from timeInterval: TimeInterval) -> (Int, Int, Int) {
        let interval = Int(timeInterval)
        
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        
        return (hours: hours, minutes: minutes, seconds: seconds)
    }
    
    // TODO: - Network request to refresh user not implemented yet!
    
    func refreshUser(completionHandler: (Bool) -> Void) {
        completionHandler(true)
    }
}
