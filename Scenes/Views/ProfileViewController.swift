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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.8)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var container: UIView = {
        configureContainer()
    }()
    
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
        
        view.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
//        view.alpha = 0.9

        view.addSubview(label)
        view.addSubview(container)
        container.addSubview(avatarView)
        
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
            make.centerX.equalTo(container)
            make.top.equalTo(container.snp.bottom).offset(10)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
            make.height.width.equalTo(150)
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
            make.height.width.equalTo(150)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserData()
    }
}

extension ProfileViewController {
    
    func configureContainer() -> UIView {
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        
        return view
    }
}
