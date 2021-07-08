//
//  FollowersListCell.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-06.
//

import Foundation
import UIKit
import Kingfisher

class FollowersListCell: UITableViewCell {
    
    //MARK: - UI elements
    
    let userPicture = UIImageView()
    let userPictureContainer = UIView()
    let username = UILabel()
    let numberOfFollowers = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureCell()
    }
    
    func setImage(url: String) {
        self.userPicture.kf.setImage(with: URL(string: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell configuration
    
    func configureCell() {
        self.userPictureContainer.addSubview(userPicture)
        self.contentView.addSubview(userPictureContainer)
        self.contentView.addSubview(username)
        self.contentView.addSubview(numberOfFollowers)
        
        self.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
        configureUserPicture()
        configureNumberOfFollowersLabel()
        configureUsernameLabel()
        configureUserPictureContainer()
        
        setupConstrains()
    }
    
    //MARK: - Setup constrains
    
    func setupConstrains() {
        
        userPictureContainer.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).offset(10)
            make.width.equalTo(60)
        }
        
        userPicture.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).offset(10)
            make.width.equalTo(60)
        }
        
        numberOfFollowers.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).inset(10)
            make.centerY.equalTo(username)
            make.height.equalTo(username)
            make.width.equalTo(120)
        }
        
        username.snp.makeConstraints { make in
            make.top.bottom.equalTo(userPictureContainer)
            make.leading.equalTo(userPictureContainer.snp.trailing).offset(10)
            make.trailing.equalTo(numberOfFollowers.snp.leading).inset(10)
        }
    }
}

extension FollowersListCell {
    
    func configureUserPicture() {
        self.userPicture.clipsToBounds = true
        self.userPicture.contentMode = .scaleAspectFit
    }
    
    func configureUserPictureContainer() {
        self.userPictureContainer.layer.masksToBounds = false
        self.userPictureContainer.layer.cornerRadius = 30
        self.userPictureContainer.clipsToBounds = true
    }
    
    func configureNumberOfFollowersLabel() {
        self.numberOfFollowers.textColor = .white.withAlphaComponent(0.8)
        self.numberOfFollowers.textAlignment = .right
    }
    
    func configureUsernameLabel() {
        self.username.textColor = .white.withAlphaComponent(0.8)
    }
}

