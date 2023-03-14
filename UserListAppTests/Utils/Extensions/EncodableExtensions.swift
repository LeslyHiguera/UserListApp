//
//  EncodableExtensions.swift
//  UserListAppTests
//
//  Created by Wilson David Molina Lozano on 13/03/23.
//

import Foundation

extension Encodable {
    
    var asDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [String: Any]()
        }
        return dictionary
    }
}
