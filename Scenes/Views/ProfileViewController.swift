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
    
    private var label = UILabel()
    
    private lazy var avatarView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    //MARK: - Button actions
    

    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        bindViewModel()
        
        view.backgroundColor = .systemPink

        view.addSubview(label)
        view.addSubview(avatarView)
        
        label.textAlignment = .center
    }
    
    //MARK: - Observable data binding
    
    private func bindViewModel() {
        viewModel.item.bind { item in
            self.label.text = item?.login
        }
        
        viewModel.avatarImage.bind { image in
            self.avatarView.image = image
        }
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        label.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.centerY.equalTo(view.center)
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).inset(50)
            make.height.equalTo(100)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserData()
    }
}
