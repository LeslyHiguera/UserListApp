//
//  UsersListRepositoryMock.swift
//  UserListAppTests
//
//  Created by Wilson David Molina Lozano on 13/03/23.
//

import Foundation
@testable import UserListApp

class UsersListRepositoryMock: UsersListRepositoryProtocol {
    
    var response: [UsersData]?
    var usersList: [UsersData] = UsersListFake.values
    
    func getUsersList(completionHandler: @escaping UserListApp.GenericCompletionHandler<Result<[UserListApp.UsersData], Error>>) {
        if let response = response {
            completionHandler(.success(response))
        }
    }
    
    func deleteUsersList() {
        usersList = []
    }
    
    func saveUsersList(_ users: [UserListApp.UsersData]) {
        usersList = UsersListFake.values
    }
    
    func getUsers() -> [UserListApp.UsersData] {
        return usersList
    }
    
}
