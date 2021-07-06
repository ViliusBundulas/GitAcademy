//
//  FollowersListViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-06.
//

import Foundation
import UIKit
import Kingfisher

class FollowersListViewController: BaseViewController {
    
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
        viewModel.userFollowers.bind { [unowned self] items in
            self.followersListtableView.reloadData()
        }
    }
    
    //MARK: - UI elements
    
    private lazy var followersListtableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FollowersListCell.self, forCellReuseIdentifier: "FollowersListCell")
        tableView.backgroundColor = .none
        
        return tableView
    }()
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        
        bindViewModel()
        
        view.backgroundColor = .systemGray2
        
        view.addSubview(followersListtableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserFollowers()
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        followersListtableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension FollowersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userFollowers.value?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersListCell", for: indexPath) as! FollowersListCell
        
        cell.userPictureContainer.backgroundColor = .red
        cell.username.text = viewModel.userFollowers.value?[indexPath.row].login
        cell.numberOfFollowers.text = "\(viewModel.userFollowers.value?[indexPath.row].id ?? 6969)"
        cell.userPicture.kf.setImage(with: URL(string: viewModel.userFollowers.value?[indexPath.row].avatarURL ?? "a"))

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
