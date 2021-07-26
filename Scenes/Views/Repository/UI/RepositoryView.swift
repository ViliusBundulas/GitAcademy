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
    let roundOrangeCircle: UIView
    
    override init() {
        self.ownerImage = UIImageView()
        self.ownerImageContainer = UIView()
        self.ownerNameLabel = UILabel()
        self.repositoryNameLabel = UILabel()
        self.repositoryDescriptionLabel = UILabel()
        self.starIcon = UIImageView()
        self.starCountLabel = UILabel()
        self.starButton = UIButton()
        self.roundOrangeCircle = UIView()
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
        self.addSubview(roundOrangeCircle)
        
        configureOwnerNameLabel()
        configureRepositoryNameLabel()
        configureRepositoryDescriptionLabel()
        configureStarIcon()
        configureStraCountLabel()
        configureLanguageLabel()
    }
    
    //MARK: - Layout subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureOwnerImage()
        configureOwnerImageContainer()
        configureOrangeCircle()
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
            make.height.greaterThanOrEqualTo(0)
        }
        
        starIcon.snp.makeConstraints { make in
            make.top.equalTo(repositoryDescriptionLabel.snp.bottom).offset(20)
            make.leading.equalTo(repositoryDescriptionLabel)
            make.height.width.equalTo(15)
        }
        
        starCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(starIcon.snp.trailing).offset(5)
            make.top.equalTo(starIcon)
            make.height.equalTo(starIcon)
            make.width.equalTo(100)
        }
        
        roundOrangeCircle.snp.makeConstraints { make in
            make.leading.equalTo(starCountLabel.snp.trailing)
            make.height.width.equalTo(starIcon)
            make.top.bottom.equalTo(starIcon)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalTo(starCountLabel)
            make.leading.equalTo(roundOrangeCircle.snp.trailing).offset(10)
            make.height.equalTo(starCountLabel)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
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
        self.repositoryDescriptionLabel.numberOfLines = 0
    }
    
    func configureStarIcon() {
        self.starIcon.image = #imageLiteral(resourceName: "starred").withRenderingMode(.alwaysTemplate)
        self.starIcon.tintColor = .white.withAlphaComponent(0.7)
    }
    
    func configureStraCountLabel() {
        self.starCountLabel.textColor = .white
        self.starCountLabel.font = self.starCountLabel.font.withSize(15)
    }
    
    func configureOrangeCircle() {
        self.roundOrangeCircle.backgroundColor = .orange.withAlphaComponent(0.9)
        self.roundOrangeCircle.layer.cornerRadius = self.roundOrangeCircle.frame.height / 2
        self.roundOrangeCircle.clipsToBounds = true
    }
    
    func configureLanguageLabel() {
        self.languageLabel.textColor = .white
        self.languageLabel.font = self.languageLabel.font.withSize(15)
    }
}
