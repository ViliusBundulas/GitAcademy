//
//  RepositoriesViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-05.
//

import Foundation
import UIKit

class RepositoriesViewController: BaseViewController {
    
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
        viewModel.repositories.bind { [unowned self] items in
            self.repositoryListTableView.reloadData()
        }
    }
    
    //MARK: - UI elements
    
    private lazy var repositoryListTableView: UITableView = {
        let tableView = SelfSizingTableView(frame: view.frame)
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
        
        view.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
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

        viewModel.getUserRepositories()
    }
}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repositories.value?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesListCell", for: indexPath) as! RepositoriesListCell
        
        cell.name.text = viewModel.repositories.value?[indexPath.row].name
        cell.repositoryDescription.text = viewModel.repositories.value?[indexPath.row].description
        cell.starCountLabel.text = "\(viewModel.repositories.value?[indexPath.row].stars ?? 666)"
        cell.language.text = viewModel.repositories.value?[indexPath.row].language
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

class SelfSizingTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        // AutoLayout uses intrinsicContentSize.height
        // instead of heightConstraint to determine
        // element height in UI
        return contentSize
    }
    
    override var contentSize: CGSize {
        didSet {
            // When content size changes, force recalculation of
            // intristic content size
            invalidateIntrinsicContentSize()
        }
    }
}
