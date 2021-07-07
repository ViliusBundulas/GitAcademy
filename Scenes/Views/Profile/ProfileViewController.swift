//
//  ProfileViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-20.
//

import UIKit
import SnapKit

class ProfileViewController: BaseViewController {
    
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
    
    private func bindViewModel() {
        viewModel.item.bind { item in
            self.userInformationView.usernameLabel.text = item?.login
            self.userInformationView.followersNumberLabel.text = item?.followers.description
            self.userInformationView.followingNumberLabel.text = item?.following.description
        }
        
        viewModel.avatarImage.bind { image in
            self.userInformationView.avatarView.image = image
        }
        
        viewModel.repositories.bind { repos in
            self.userRepositoriesView.countLabel.text = "\(repos?.count ?? 0)  >"
        }
        
        viewModel.starredRepositories.bind { repos in
            self.starredUserRepositoriesView.countLabel.text = "\(repos?.count ?? 0)  >"
        }
    }
    
    //MARK: UI elements
    
    private lazy var repositoriesViewButton: UITapGestureRecognizer = {
        configureRepositoriesGestureRecogniser()
    }()
    
    private lazy var starredRepositoriesViewButton: UITapGestureRecognizer = {
        configureStarredRepositoriesGestureRecogniser()
    }()
    
    private lazy var userInformationView: UserInformationView = {
        configureUserInformationView()
    }()
    
    private lazy var logoutButton: UIButton = {
        configureLogoutButton()
    }()
    
    private lazy var settingsButton: UIButton = {
        configureSettingsButton()
    }()
    
    private lazy var userRepositoriesView: RepositoryListView = {
        configureRepositoriesView()
    }()
    
    private lazy var starredUserRepositoriesView: RepositoryListView = {
        configureStarredView()
    }()
    
    
    //MARK: - Button actions
    
    @objc func logoutButtonPressed() {
        
    }
    
    @objc func repositoriesButtonPressed(sender: UITapGestureRecognizer) {
        coordinator?.startRepositoriesViewController()
    }
    
    @objc func starredRepositoriesButtonPressed(sender: UITapGestureRecognizer) {
        coordinator?.startStarredRepositoriesViewController()
    }
    
    @objc func settingsButtonPressed() {
        
    }
    
    @objc func followersButtonPressed() {
        coordinator?.startFollowersListViewController()
    }
    
    @objc func followingButtonPressed() {
        coordinator?.startFollowingListViewController()
    }
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()

        bindViewModel()
        
        view.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
        view.addSubview(userInformationView)
        view.addSubview(logoutButton)
        view.addSubview(settingsButton)
        view.addSubview(userRepositoriesView)
        view.addSubview(starredUserRepositoriesView)
        
        userRepositoriesView.addGestureRecognizer(repositoriesViewButton)
        starredUserRepositoriesView.addGestureRecognizer(starredRepositoriesViewButton)
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        userInformationView.snp.makeConstraints { make in
            make.top.equalTo(logoutButton.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(300)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(logoutButton.snp.leading)
            make.bottom.equalTo(logoutButton.snp.bottom)
        }
        
        userRepositoriesView.snp.makeConstraints { make in
            make.top.equalTo(userInformationView.snp.bottom)
            make.height.equalTo(50)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).inset(10)
        }
        
        starredUserRepositoriesView.snp.makeConstraints { make in
            make.top.equalTo(userRepositoriesView.snp.bottom).offset(10)
            make.height.leading.trailing.equalTo(userRepositoriesView)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        viewModel.getUserData()
        viewModel.getUserRepositories()
        viewModel.getUserStarredRepositories()
        viewModel.getUserFollowers()
    }
}

    //MARK: - UI configurations

extension ProfileViewController {
    
    func configureSettingsButton() -> UIButton {
        let button = UIButton()
        button.tintColor = .white
        let image = #imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        
        return button
    }
    
    func configureLogoutButton() -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        
        return button
    }
    
    func configureRepositoriesView() -> RepositoryListView {
        let reposView = RepositoryListView()
        reposView.backgroundColor = UIColor(red: 35.0/255, green: 37.0/255, blue: 42.0/255, alpha: 1.0)
        reposView.isUserInteractionEnabled = true
        reposView.iconContainerView.backgroundColor = .purple
        reposView.listNameLabel.text = "Repositories"
        reposView.listNameLabel.textColor = .white.withAlphaComponent(0.8)
        reposView.countLabel.textColor = .white.withAlphaComponent(0.8)
        reposView.iconView.image = #imageLiteral(resourceName: "repositories").withRenderingMode(.alwaysTemplate)
        reposView.iconView.tintColor = .white
        reposView.iconView.contentMode = .scaleAspectFit
        
        return reposView
    }
    
    func configureStarredView() -> RepositoryListView {
        let reposView = RepositoryListView()
        reposView.backgroundColor = UIColor(red: 35.0/255, green: 37.0/255, blue: 42.0/255, alpha: 1.0)
        reposView.iconContainerView.backgroundColor = .yellow
        reposView.listNameLabel.text = "Starred"
        reposView.listNameLabel.textColor = .white.withAlphaComponent(0.8)
        reposView.countLabel.textColor = .white.withAlphaComponent(0.8)
        reposView.iconView.image = #imageLiteral(resourceName: "starred")
        reposView.iconView.contentMode = .scaleAspectFit
        
        return reposView
    }
    
    func configureRepositoriesGestureRecogniser() -> UITapGestureRecognizer {
        let button = UITapGestureRecognizer(target: self, action: #selector(repositoriesButtonPressed))
        
        return button
    }
    
    func configureStarredRepositoriesGestureRecogniser() -> UITapGestureRecognizer {
        let button = UITapGestureRecognizer(target: self, action: #selector(starredRepositoriesButtonPressed))
        
        return button
    }
    
    func configureUserInformationView() -> UserInformationView {
        let userView = UserInformationView()
        userView.followersTapGesture.addTarget(self, action: #selector(followersButtonPressed))
        userView.followingTapGesture.addTarget(self, action: #selector(followingButtonPressed))
        
        return userView
    }
}
