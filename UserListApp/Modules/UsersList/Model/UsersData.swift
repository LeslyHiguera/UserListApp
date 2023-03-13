//
//  UsersData.swift
//  UserListApp
//
//  Created by Lesly Higuera on 11/03/23.
//

import Foundation
import UIKit

struct UserInfo: Decodable {
    let data: [UsersData]?
    
    init(data: [UsersData]?) {
        self.data = data
    }
}

struct UsersData: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
    let phone: String?
    let website: String?
    let company: Company?
}

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?

}

struct Geo: Codable {
    let lat: String?
    let lng: String?
}

struct Company: Codable {
    let name: String?
    let catchPhrase: String?
    let bs: String?

}