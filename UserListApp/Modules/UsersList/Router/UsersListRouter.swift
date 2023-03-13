//
//  UsersListRouter.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 13/03/23.
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
