//
//  ViewControllerExtensions.swift
//  UserListApp
//
//  Created by Wilson David Molina Lozano on 13/03/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, action: @escaping (UIAlertAction) -> Void) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(.init(title: "Ok", style: .default))
        alertView.addAction(.init(title: "Retry", style: .default, handler: action))
        self.present(alertView, animated: true)
    }
    
}
