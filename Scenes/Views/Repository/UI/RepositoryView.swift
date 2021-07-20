//
//  RepositoryViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-08.
//

import Foundation
import UIKit

class RepositoryView: BaseView {
    
    
    //MARK: - UI elements
    
    let ownerImage: UIImageView
    let ownerImageContainer: UIView
    let ownerNameLabel: UILabel
    let repositoryNameLabel: UILabel
    let repositoryDescriptionLabel: UILabel
    let starIcon: UIImageView
    let starCountLabel: UILabel
    let starButton: UIButton
    let languageLabel: UILabel
    
    override init() {
        self.ownerImage = UIImageView()
        self.ownerImageContainer = UIView()
        self.ownerNameLabel = UILabel()
        self.repositoryNameLabel = UILabel()
        self.repositoryDescriptionLabel = UILabel()
        self.starIcon = UIImageView()
        self.starCountLabel = UILabel()
        self.starButton = UIButton()
        self.languageLabel = UILabel()
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup views
    
    override func setupView() {
        super.setupView()
        
        self.addSubview(ownerImageContainer)
        ownerImageContainer.addSubview(ownerImage)
        self.addSubview(ownerNameLabel)
        self.addSubview(repositoryNameLabel)
        self.addSubview(repositoryDescriptionLabel)
        self.addSubview(starIcon)
        self.addSubview(starCountLabel)
        self.addSubview(starButton)
        self.addSubview(languageLabel)
        
        configureOwnerNameLabel()
        configureRepositoryNameLabel()
        configureRepositoryDescriptionLabel()
    }
    
    //MARK: - Layout subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureOwnerImage()
        configureOwnerImageContainer()
    }
    
    //MARK: Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        ownerImageContainer.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(40)
        }
        
        ownerImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(40)
        }
        
        ownerNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(ownerImageContainer)
            make.leading.equalTo(ownerImageContainer.snp.trailing).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
        
        repositoryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(ownerImageContainer.snp.bottom)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(60)
        }
        
        repositoryDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(repositoryNameLabel.snp.bottom)
            make.leading.trailing.equalTo(repositoryNameLabel)
            make.height.equalTo(ownerNameLabel)
        }
    }
}

    //MARK: - View configurations

extension RepositoryView {
    
    func configureOwnerImage() {
        self.ownerImage.clipsToBounds = true
        self.ownerImage.contentMode = .scaleAspectFit
    }
    
    func configureOwnerImageContainer() {
        self.ownerImageContainer.layer.masksToBounds = false
        self.ownerImageContainer.layer.cornerRadius = self.ownerImageContainer.frame.height / 2
        self.ownerImageContainer.clipsToBounds = true
    }
    
    func configureOwnerNameLabel() {
        self.ownerNameLabel.textColor = .white.withAlphaComponent(0.8)
    }
    
    func configureRepositoryNameLabel() {
        self.repositoryNameLabel.font = repositoryNameLabel.font.withSize(40)
        self.repositoryNameLabel.textColor = .white
    }
    
    func configureRepositoryDescriptionLabel() {
        self.repositoryDescriptionLabel.textColor = .white
    }
}
