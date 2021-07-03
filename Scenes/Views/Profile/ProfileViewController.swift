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
    
    
    //MARK: - Button actions
    

    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        bindViewModel()
        
        view.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
        view.addSubview(userInformationView)
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
        
        userInformationView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.trailing.bottom.equalTo(view)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserData()
    }
}
