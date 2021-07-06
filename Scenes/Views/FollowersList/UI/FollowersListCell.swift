//
//  FollowersListCell.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-06.
//

import Foundation
import UIKit

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell configuration
    
    func configureCell() {
        self.userPictureContainer.addSubview(userPicture)
        self.contentView.addSubview(userPictureContainer)
        self.contentView.addSubview(username)
        self.contentView.addSubview(numberOfFollowers)
        
        configureUserPicture()
        configureNumberOfFollowersLabel()
        configureUsernameLabel()
        configureUserPictureContainer()
        
        setupConstrains()
    }
    
    //MARK: - Setup constrains
    
    func setupConstrains() {
        
        userPictureContainer.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.width.height.equalTo(80)
        }
        
        userPicture.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.width.height.equalTo(80)
        }
        
        numberOfFollowers.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView)
            make.height.equalTo(userPictureContainer)
            make.width.equalTo(70)
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
        self.userPictureContainer.layer.cornerRadius = 40
        self.userPictureContainer.clipsToBounds = true
    }
    
    func configureNumberOfFollowersLabel() {
        
    }
    
    func configureUsernameLabel() {
        
    }
}
