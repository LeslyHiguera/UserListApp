//
//  UsersListRouter.swift
//  UserListApp
//
//  Created by Wilson David Molina Lozano on 13/03/23.
//

import UIKit

class UsersListRouter {
    
    // MARK: - Properties
    
    weak var view: UsersListViewController?
    
    // MARK: - Methods
    
    func goToUserDetail(userData: UsersData) {
        let vc = DetailUserViewController()
        vc.userData = userData
        vc.modalTransitionStyle = .flipHorizontal
        view?.present(vc, animated: true)
    }
    
}
