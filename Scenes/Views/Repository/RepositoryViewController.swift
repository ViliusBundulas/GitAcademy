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
    
    //MARK: - Observable data binding
    
    private func bindViewModel() {
        viewModel.selectedUserRepository.bind { [unowned self ]repository in
            self.repositoryView.ownerNameLabel.text = repository?.owner.login
        }
    }
    
    //MARK: - setup views
    
    override func setupView() {
        super.setupView()
        
        bindViewModel()
        
        view.addSubview(repositoryView)
    }
    
    //MARK: - setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        repositoryView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
    }
}
