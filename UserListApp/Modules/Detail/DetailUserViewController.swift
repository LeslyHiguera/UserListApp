//
//  DetailUsersViewController.swift
//  UserListApp
//
//  Created by Lesly Higuera on 12/03/23.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
   
    
    // MARK: - Properties
    
    var userData: UsersData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Methods
    
    private func setupView() {
        nameLabel.text = userData?.name
        usernameLabel.text = userData?.username
        idLabel?.text = "Identification code: \(userData?.id ?? 0)"
        emailLabel.text = "Email: \(userData?.email ?? "")"
        addressLabel.text = "Address \n Street: \(userData?.address?.street ?? "") \n Suite: \(userData?.address?.suite ?? "") \n City: \(userData?.address?.city ?? "") \n Zipcode: \(userData?.address?.zipcode ?? "") \n Geo: \(userData?.address?.geo?.lat ?? "") \(userData?.address?.geo?.lng ?? "")"
        phoneLabel.text = "Phone: \(userData?.phone ?? "")"
        websiteLabel.text = "Website: \(userData?.website ?? "")"
        companyLabel.text = "Company: \(userData?.company?.name ?? "") \n CatchPhrase: \(userData?.company?.catchPhrase ?? "") \n BS: \(userData?.company?.bs ?? "")"

         
    }

}
