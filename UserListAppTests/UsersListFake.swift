//
//  UsersListFake.swift
//  UserListAppTests
//
//  Created by Wilson David Molina Lozano on 13/03/23.
//

import Foundation
@testable import UserListApp


enum UsersListFake {
    
    static var values: [UsersData] {
        [.init(id: 0,
               name: "",
               username: "",
               email: "",
               address: Address.init(street: "",
                                     suite: "",
                                     city: "",
                                     zipcode: "",
                                     geo: Geo.init(lat: "", lng: "")),
               phone: "",
               website: "",
               company: Company.init(name: "",
                                     catchPhrase: "",
                                     bs: ""))]
    }
}
