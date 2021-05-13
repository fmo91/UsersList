//
//  UserTableViewCell.swift
//  UsersList
//
//  Created by Fernando Ortiz - Parser on 13/05/2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(for user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
