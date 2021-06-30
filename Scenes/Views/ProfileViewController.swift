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
    
    //MARK: UI elements
    
    private var label = UILabel()
    
    private var button: UIButton = {
        let buttone = UIButton()
        buttone.titleLabel?.text = "Press"
        buttone.backgroundColor = .yellow
        buttone.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return buttone
    }()
    
    //MARK: - Button actions
    
    @objc func buttonPressed() {
//        viewModel.getUserData()
    }
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        bindViewModel()
        
        view.backgroundColor = .systemPink
        
        view.addSubview(button)
        view.addSubview(label)
        
        label.textAlignment = .center
    }
    
    //MARK: - Observable data binding
    
    private func bindViewModel() {
        viewModel.item.bind { item in
            self.label.text = item?.login
        }
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        button.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.centerX.equalTo(view)
        }
        
        label.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.centerY.equalTo(view.center)
        }
    }
    
    //MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.getUserData()
    }
}
