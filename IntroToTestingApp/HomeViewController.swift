//
//  ViewController.swift
//  IntroToTestingApp
//
//  Created by Chase Wang on 2/7/17.
//  Copyright © 2017 ocwang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Instance Vars
    
    var users = [
        User(username: "user 1", fullName: "user 1", lastActive: 100),
        User(username: "user 2", fullName: "user 2", lastActive: 5000),
        User(username: "user 3", fullName: "user 3", lastActive: 100000)
    ]
    
    // MARK: - Subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -
    
    func add(_ user: User) {
        users.append(user)
    }
    
    func removeFirstUser() {
        users.removeFirst()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = "Last Active: \(user.lastActive)"
        
        return cell
    }
}

// MARK: - Navigation

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toProfile",
            let profileViewController = segue.destination as? ProfileViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let user = users[indexPath.row]
        profileViewController.viewModel = ProfileViewModel(user: user)
    }
}
