//
//  ProfileViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-20.
//

import UIKit
import SnapKit
import Alamofire

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
    
    //MARK: UI elements
    
    private lazy var userInformationView = UserInformationView()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        let image = #imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    
    //MARK: - Button actions
    
    @objc func logoutButtonPressed() {
        coordinator?.start()
    }
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()

        bindViewModel()
        
        view.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
        view.addSubview(userInformationView)
        view.addSubview(logoutButton)
        view.addSubview(settingsButton)
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
            make.leading.trailing.bottom.equalTo(view)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(logoutButton.snp.leading)
            make.bottom.equalTo(logoutButton.snp.bottom)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getUserData()
        viewModel.getUserRepositories()
    }
}
