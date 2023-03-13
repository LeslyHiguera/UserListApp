//
//  DetailUsersViewController.swift
//  UserListApp
//
//  Created by Lesly Higuera on 12/03/23.
//

import UIKit

class DetailUsersViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var geoLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websideLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    // MARK: - Properties
    var showUsers: UsersData? {
        didSet {
            setupView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    // MARK: - Methods
    
    private func setupView() {
        nameLabel.text = showUsers?.name
        usernameLabel.text = showUsers?.username
        //idLabel.text = Int64(showUsers?.id ?? 0)
        emailLabel.text = showUsers?.email
        //addressLabel.text = "Address : \(showUsers?.address ?? "") "
        streetLabel.text = showUsers?.address?.street
        suiteLabel.text = showUsers?.address?.suite
        cityLabel.text = showUsers?.address?.city
        zipcodeLabel.text = showUsers?.address?.zipcode
        //geoLabel.text = showUsers?.address?.geo
        latLabel.text = showUsers?.address?.geo?.lat
        lngLabel.text = showUsers?.address?.geo?.lng
        phoneLabel.text = showUsers?.phone
        websideLabel.text = showUsers?.website
        //companyLabel.text = showUsers?.company
        companyNameLabel.text = showUsers?.company?.name
        catchPhraseLabel.text = showUsers?.company?.catchPhrase
        bsLabel.text = showUsers?.company?.bs
         
        
    }

}
