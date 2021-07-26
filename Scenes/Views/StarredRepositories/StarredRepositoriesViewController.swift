//
//  StarredRepositoriesViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-08.
//

import Foundation
import UIKit

class StarredRepositoriesViewController: BaseViewController {
    
    weak var coordinator: MainCoordinator?
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Observable data binding
    
    func bindViewModel() {
        viewModel.starredRepositories.bind { [unowned self] items in
            self.repositoryListTableView.reloadData()
        }
    }
    
    //MARK: - UI elements
    
    private lazy var repositoryListTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RepositoriesListCell.self, forCellReuseIdentifier: "RepositoriesListCell")
        tableView.backgroundColor = .none
        
        return tableView
    }()
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        
        bindViewModel()
        
        repositoryListTableView.delegate = self
        repositoryListTableView.dataSource = self
        
        view.addSubview(repositoryListTableView)
        
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        repositoryListTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserStarredRepositories()
    }
}

    //MARK: - UITableView configurations

extension StarredRepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.starredRepositories.value?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesListCell", for: indexPath) as! RepositoriesListCell
        
        cell.name.text = viewModel.starredRepositories.value?[indexPath.row].name
        cell.repositoryDescription.text = viewModel.starredRepositories.value?[indexPath.row].description
        cell.starCountLabel.text = "\(viewModel.starredRepositories.value?[indexPath.row].stars ?? 666)"
        cell.language.text = viewModel.starredRepositories.value?[indexPath.row].language
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getSelectedRepositoryFromStarredRepositories(at: indexPath.row)
        coordinator?.startRepositoryViewController(repository: viewModel.selectedUserRepository.value!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
