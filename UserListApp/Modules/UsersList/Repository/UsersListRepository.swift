//
//  UsersListRepository.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 11/03/23.
//

import Foundation
import UIKit
import CoreData

protocol UsersListRepositoryProtocol {
    func getUsersList(completionHandler: @escaping GenericCompletionHandler<Result<[UsersData], Error>>)
    func deleteUsersList()
    func saveUsersList(_ users: [UsersData])
    func getUsers() -> [UsersData]
}

class UsersListRepository: UsersListRepositoryProtocol {
    
    func getUsersList(completionHandler: @escaping GenericCompletionHandler<Result<[UsersData], Error>>) {
        APIManager.request(with: APIConstants.apiTopUrl, completionHandler: completionHandler)
    }
    
    func saveUsersList(_ users: [UsersData]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        users.forEach { user in
            let usersCoreData = UsersCD(context: appDelegate.persistentContainer.viewContext)
            usersCoreData.id = Int64(user.id ?? 0)
            usersCoreData.name = user.name
            usersCoreData.username = user.username
            usersCoreData.email = user.email
            usersCoreData.phone = user.phone
            usersCoreData.website = user.website
            usersCoreData.street = user.address?.street
            usersCoreData.suite = user.address?.suite
            usersCoreData.city = user.address?.city
            usersCoreData.zipcode = user.address?.zipcode
            usersCoreData.lat = user.address?.geo?.lat
            usersCoreData.lng = user.address?.geo?.lng
            usersCoreData.companyName = user.company?.name
            usersCoreData.catchPhrase = user.company?.catchPhrase
            usersCoreData.bs = user.company?.bs
            appDelegate.saveContext()
        }
    }
    
    func getUsers() -> [UsersData] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        var usersData: [UsersData] = []
        do {
            let fetchRequest: NSFetchRequest<UsersCD> = UsersCD.fetchRequest()
            let usersCoreData = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            usersCoreData.forEach {
                let dataCD = UsersData(id: Int($0.id),
                                       name: $0.name,
                                       username: $0.username,
                                       email: $0.email,
                                       address: Address(street: $0.street,
                                                        suite: $0.suite,
                                                        city: $0.city,
                                                        zipcode: $0.zipcode,
                                                        geo: Geo(lat: $0.lat,
                                                                 lng: $0.lng)),
                                       phone: $0.phone,
                                       website: $0.website,
                                       company: Company(name: $0.companyName,
                                                        catchPhrase: $0.catchPhrase,
                                                        bs: $0.bs))
                usersData.append(dataCD)
            }
        } catch {
            print(error.localizedDescription)
        }
        return usersData
    }
    
    func deleteUsersList() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        do {
            let fetchRequest: NSFetchRequest<UsersCD> = UsersCD.fetchRequest()
            let usersCoreData = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            
            usersCoreData.forEach {
                appDelegate.persistentContainer.viewContext.delete($0)
            }
            try appDelegate.persistentContainer.viewContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
