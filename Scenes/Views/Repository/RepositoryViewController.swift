//
//  RepositoryViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-08.
//

import Foundation
import UIKit

class RepositoryViewController: BaseViewController {
    
    weak var coordinator: MainCoordinator?
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI elements
    
    private lazy var repositoryView: RepositoryView = {
        let view = RepositoryView()
        view.ownerImage.backgroundColor = .blue
        view.ownerImageContainer.backgroundColor = .green
        view.backgroundColor = .systemGray2
        
        view.ownerNameLabel.backgroundColor = .red
        
        return view
    }()
    
    private lazy var testLabel: UILabel = {
       let label = UILabel()
        label.text = "Labas dienas"
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: - Observable data binding
    
    private func bindViewModel() {
        viewModel.selectedUserRepository.bind { repository in
            if repository?.owner.login != nil {
                self.testLabel.text = repository?.owner.login
            } else {
                self.testLabel.text = "You can do this!"
            }
        }
    }
    
    //MARK: - setup views
    
    override func setupView() {
        super.setupView()
        
        bindViewModel()
        
//        view.addSubview(repositoryView)
        view.addSubview(testLabel)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    //MARK: - setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
//        repositoryView.snp.makeConstraints { make in
//            make.leading.trailing.top.bottom.equalTo(view)
//        }
        
        testLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }
    }
}
