//
//  UsersListAdapter.swift
//  UserListApp
//
//  Created by Lesly Higuera on 11/03/23.
//

import UIKit

class UsersListAdapter: NSObject {
    
    // MARK: - Properties
    
    var viewModel: UsersListViewModel
    var firstCV: UITableView
    
    internal init(viewModel: UsersListViewModel, firstCV: UITableView) {
        self.viewModel = viewModel
        self.firstCV = firstCV
    }
    
    // MARK: - Observable Properties
    
    var didSelectItemAt: Observable <UsersData> {
        mutableDidSelectItemAt
    }
    
    private var mutableDidSelectItemAt = MutableObservable<UsersData>()
    
}



// MARK: - UITableViewDataSource

extension UsersListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UsersTableViewCell else { return UITableViewCell() }
        cell.userData = viewModel.usersList[indexPath.row]
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate

extension UsersListAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView == firstCV {
            let vc = DetailUsersViewController()
            vc.showUsers = viewModel.usersList[indexPath.row]
        } else if tableView == firstCV {
            let vc = DetailUsersViewController()
            vc.showUsers = viewModel.usersList[indexPath.row]
        }
        
       /* if tableView == firstCV {
            self.mutableDidSelectItemAt.postValue(viewModel.usersList[indexPath.row])
        } else {
            self.mutableDidSelectItemAt.postValue(viewModel.usersList[indexPath.row])
        }*/
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
