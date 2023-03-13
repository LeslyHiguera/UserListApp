//
//  UsersListViewController.swift
//  UserListApp
//
//  Created by Lesly Higuera on 11/03/23.
//

import UIKit

class UsersListViewController: UIViewController {
    
    // MARK: - IBOtlets
    
    @IBOutlet private weak var usersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    var viewModel: UsersListViewModel
    
    lazy var adapter = UsersListAdapter(viewModel: viewModel, firstCV: usersTableView)
    
    init(viewModel: UsersListViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTableView()
        getUsersList()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        setupNavigationBar()
    }
    
    private func getUsersList() {
        viewModel.getUsersList()
        activityIndicator.startAnimating()
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            if !self.viewModel.usersList.isEmpty {
                self.activityIndicator.stopAnimating()
            }
            self.usersTableView.reloadData()
        }
        viewModel.error = { [weak self] error in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            let alertView = UIAlertController(title: "", message: error, preferredStyle: .alert)
            alertView.addAction(.init(title: "Ok", style: .default))
            alertView.addAction(.init(title: "Reintentar", style: .default, handler: { _ in
                self.activityIndicator.startAnimating()
                self.viewModel.getUsersList()
            }))
            self.present(alertView, animated: true)
        }
    }
    
    private func setTableView() {
        usersTableView.register(.init(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        setTableViewViewDelegates()
    }
    
    private func setTableViewViewDelegates() {
        usersTableView.dataSource = adapter
        usersTableView.delegate = adapter
    }
    
    private func setupNavigationBar() {
        title = "List of Users"
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.backgroundColor = UIColor.systemIndigo
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }


}
