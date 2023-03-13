//
//  UsersListRepository.swift
//  UserListApp
//
//  Created by Lesly Higuera on 11/03/23.
//

import Foundation
import UIKit
import CoreData

protocol UsersListRepositoryProtocol {
    func getUsersList(completionHandler: @escaping GenericCompletionHandler<Result<[UsersData], Error>>)
    func getUser(completionHandler: @escaping (Result<UserInfo, Error>) -> Void)
    func showUser(completionHandler: @escaping (Result<UserInfo, Error>) -> Void) 
}

class UsersListRepository: UsersListRepositoryProtocol {
    
    func getUsersList(completionHandler: @escaping GenericCompletionHandler<Result<[UsersData], Error>>) {
        APIManager.request(with: APIConstants.apiTopUrl, completionHandler: completionHandler)
    }
    
    func getUser(completionHandler: @escaping (Result<UserInfo, Error>) -> Void) {
        let localUsers = self.getUsers()
        if localUsers.count > 0  {
            completionHandler(.success(UserInfo(data: localUsers)))
            return
        }
        
        APIManager.request(with: APIConstants.apiTopUrl) { (result: Result<UserInfo, Error>) in
            switch result {
            case .success(let success):
                self.deleteUser()
                self.saveUser(success)
                completionHandler(.success(success))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func showUser(completionHandler: @escaping (Result<UserInfo, Error>) -> Void) {
        let localUsers = self.getUsers()
        if localUsers.count > 0  {
            completionHandler(.success(UserInfo(data: localUsers)))
            return
        }
        
        APIManager.request(with: APIConstants.apiTopUrl) { (result: Result<UserInfo, Error>) in
            switch result {
            case .success(let success):
                self.deleteUser()
                self.saveUser(success)
                completionHandler(.success(success))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    func saveUser(_ users: UserInfo) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        users.data?.forEach { user in
            let usersCoreData = DataCD(context: appDelegate.persistentContainer.viewContext)
            //usersCoreData.id = Int64(user.id ?? 0)
            usersCoreData.name = user.name
            usersCoreData.username = user.username
            usersCoreData.email = user.email
            //usersCoreData.address = user.address
            usersCoreData.phone = user.phone
            usersCoreData.website = user.website
            //usersCoreData.company = user.company
           
            appDelegate.saveContext()
        }
    }
    
    private func getUsers() -> [UsersData] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        var userInfo: [UsersData] = []
        do {
            let fetchRequest: NSFetchRequest<DataCD> = DataCD.fetchRequest()
            let coreDataUsers = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            coreDataUsers.forEach {
                let dataCD = UsersData(id: $0.id?,
                                       name: $0.name,
                                       username: $0.username,
                                       email: $0.email,
                                       address: $0.address,
                                       phone: $0.phone,
                                       website: $0.website,
                                       company: $0.company)
                
                userInfo.append(dataCD)
            }
        } catch {
            print(error.localizedDescription)
        }
        return userInfo
    }
    
    private func deleteUser() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        do {
            let fetchRequest: NSFetchRequest<DataCD> = DataCD.fetchRequest()
            let coreDataUsers = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            
            coreDataUsers.forEach {
                appDelegate.persistentContainer.viewContext.delete($0)
            }
            try appDelegate.persistentContainer.viewContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
