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
    
    var router: UsersListRouter
    
    lazy var adapter = UsersListAdapter(viewModel: viewModel)
    
    init(viewModel: UsersListViewModel, router: UsersListRouter) {
        self.viewModel = viewModel
        self.router = router

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
        setupBindings()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        activityIndicator.hidesWhenStopped = true
        setupNavigationBar()
    }
    
    private func getUsersList() {
        viewModel.getUsersList()
    }
    
    private func setupBindings() {
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        
        adapter.didSelectItemAt.observe { [unowned self] userDescription in
            router.goToUserDetail(userData: userDescription)
        }
    }
    
    private func validateEvents(event: UsersListViewModelOutput) {
        switch event {
        case .isLoading(let isLoading):
            if isLoading {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        case .didGetData:
            usersTableView.reloadData()
        case .errorMessage(let error):
            print(error)
            showAlert(title: "Alert!", message: "Has been ocurred a error!", action: { _ in
                self.activityIndicator.startAnimating()
                self.getUsersList()
            })
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
