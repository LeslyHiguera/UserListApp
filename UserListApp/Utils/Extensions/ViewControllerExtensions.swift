//
//  ViewControllerExtensions.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 13/03/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, okAction: @escaping (UIAlertAction) -> Void, retryAction: @escaping (UIAlertAction) -> Void) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(.init(title: "Ok", style: .default, handler: okAction))
        alertView.addAction(.init(title: "Retry", style: .default, handler: retryAction))
        self.present(alertView, animated: true)
    }
    
}
