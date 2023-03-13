//
//  UsersListFactory.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 12/03/23.
//

import UIKit

class UsersListFactory {

    static func configure() -> UIViewController {
        let repository = UsersListRepository()
        let router = UsersListRouter()
        let viewModel = UsersListViewModel(repository: repository)
        let controller = UsersListViewController(viewModel: viewModel, router: router)
        router.view = controller
        return controller
    }
    
}
