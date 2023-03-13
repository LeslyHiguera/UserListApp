//
//  UsersListViewModel.swift
//  UserListApp
//
//  Created by Lesly Higuera on 12/03/23.
//

import Foundation

class UsersListViewModel {
    
    // MARK: - Internal Properties
    
    var error: GenericCompletionHandler<String> = { _ in }
    var success: CompletionHandler = {}
    var usersList: [UsersData] = []
    var showAnime: [UsersData] = []
    
    // MARK: - Private Properties
    
    private var repository: UsersListRepositoryProtocol!
    
    // MARK: - Initializers
    
    init(repository: UsersListRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func getUsersList() {
        repository.getUsersList { result in
            switch result {
            case .success(let data):
                self.usersList = data
                self.success()
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
    
    func showUsers() {
        repository.showUser { result in
            switch result {
            case .success(let users):
                self.showAnime = users.data ?? []
                self.success()
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
    
}
