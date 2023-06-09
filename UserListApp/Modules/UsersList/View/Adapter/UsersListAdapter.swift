//
//  UsersListAdapter.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 11/03/23.
//

import UIKit

class UsersListAdapter: NSObject {
    
    // MARK: - Properties
    
    var viewModel: UsersListViewModel
    
    // MARK: - Observable Properties
    
    var didSelectItemAt: Observable <UsersData> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Observable Properties
    
    private var mutableDidSelectItemAt = MutableObservable<UsersData>()
    
    // MARK: - Initializers
    
    internal init(viewModel: UsersListViewModel) {
        self.viewModel = viewModel
    }
    
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
        mutableDidSelectItemAt.postValue(viewModel.usersList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
