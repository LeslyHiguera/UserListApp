//
//  UsersListFactory.swift
//  UserListApp
//
//  Created by Lesly Higuera on 12/03/23.
//

import UIKit

class UsersListFactory {

    static func configure() -> UIViewController {
        let repository = UsersListRepository()
        let viewModel = UsersListViewModel(repository: repository)
        let controller = UsersListViewController(viewModel: viewModel)
        return controller
    }
    
}