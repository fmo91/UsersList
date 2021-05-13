//
//  ViewController.swift
//  UsersList
//
//  Created by Fernando Ortiz - Parser on 13/05/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self

        getUsers()
    }

    private func getUsers() {
        APIClient.getUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let user = users[row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        cell.configure(for: user)
        return cell
    }
}
