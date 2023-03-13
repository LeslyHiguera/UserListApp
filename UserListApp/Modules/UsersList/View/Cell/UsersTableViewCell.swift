//
//  UsersTableViewCell.swift
//  UserListApp
//
//  Created by Lesly Higuera on 11/03/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var websideLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var userData: UsersData? {
        didSet {
            setupCell()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupCell() {
        nameLabel.text = userData?.name
        emailLabel.text = userData?.email
        websideLabel.text = userData?.website
    }
    
}
