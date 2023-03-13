//
//  UsersListViewModel.swift
//  UserListApp
//
//  Created by Lesly Higuera on 12/03/23.
//

import Foundation

enum UsersListViewModelOutput {
    case isLoading(Bool)
    case didGetData
    case errorMessage(String)
}

class UsersListViewModel {
    
    // MARK: - Internal Properties
    
    var error: GenericCompletionHandler<String> = { _ in }
    var success: CompletionHandler = {}
    var usersList: [UsersData] = []
    
    // MARK: - Private Properties
    
    private var repository: UsersListRepositoryProtocol!
    
    // MARK: - Observable Properties
    
    var outputEvents: Observable<UsersListViewModelOutput> {
        mutableOutputEvents
    }
    
    private let mutableOutputEvents = MutableObservable<UsersListViewModelOutput>()
    
    // MARK: - Initializers
    
    init(repository: UsersListRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func getUsersList() {
        print("--Get users list--")
        let localUsers = repository.getUsers()
        if localUsers.count > 0  {
            self.usersList = localUsers
            self.mutableOutputEvents.postValue(.didGetData)
            return
        }
        
        mutableOutputEvents.postValue(.isLoading(true))
        repository.getUsersList { result in
            self.mutableOutputEvents.postValue(.isLoading(false))
            switch result {
            case .success(let usersList):
                self.repository.deleteUsersList()
                self.repository.saveUsersList(usersList)
                self.usersList = usersList
                self.mutableOutputEvents.postValue(.didGetData)
            case .failure(let error):
                self.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
            }
        }
    }
    
}
