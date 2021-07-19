//
//  UserInformationView.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-03.
//

import Foundation
import UIKit

class UserInformationView: BaseView {
    
    //MARK: - UI elements

    let avatarViewContainer: UIView
    let avatarView: UIImageView
    let usernameLabel: UILabel
    
    let followersIcon: UIImageView
    
    let followersContainer: UIView
    let followersLabel: UILabel
    let followersNumberLabel: UILabel
    
    let followingContainer: UIView
    let followingLabel: UILabel
    let followingNumberLabel: UILabel
    
    let followersTapGesture: UITapGestureRecognizer
    let followingTapGesture: UITapGestureRecognizer
    
    override init() {
        
        self.avatarViewContainer = UIView()
        
        self.avatarView = UIImageView()
        self.avatarView.clipsToBounds = true
        self.avatarView.contentMode = .scaleAspectFit
        
        self.usernameLabel = UILabel()
        self.usernameLabel.textAlignment = .center
        self.usernameLabel.textColor = .white.withAlphaComponent(0.8)
        self.usernameLabel.adjustsFontSizeToFitWidth = true
        
        self.followersIcon = UIImageView()
        self.followersIcon.image = #imageLiteral(resourceName: "followers").withRenderingMode(.alwaysTemplate)
        self.followersIcon.tintColor = .white
        
        self.followersContainer = UIView()
        
        self.followersLabel = UILabel()
        self.followersLabel.textAlignment = .center
        self.followersLabel.textColor = .white.withAlphaComponent(0.8)
        self.followersLabel.text = "followers"
        
        self.followersNumberLabel = UILabel()
        self.followersNumberLabel.textColor = .white
        self.followersNumberLabel.textAlignment = .left
        
        self.followingContainer = UIView()
        
        self.followingLabel = UILabel()
        self.followingLabel.textAlignment = .center
        self.followingLabel.textColor = .white.withAlphaComponent(0.8)
        self.followingLabel.text = "following"
        
        self.followingNumberLabel = UILabel()
        self.followingNumberLabel.textColor = .white
        self.followingNumberLabel.textAlignment = .center
        
        self.followersTapGesture = UITapGestureRecognizer()
        self.followingTapGesture = UITapGestureRecognizer()
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    
    override func setupView() {
        super.setupView()
        
        self.addSubview(avatarViewContainer)
        avatarViewContainer.addSubview(avatarView)
        
        self.addSubview(usernameLabel)
        
        self.addSubview(followersIcon)
        
        self.addSubview(followersContainer)
        followersContainer.addSubview(followersLabel)
        followersContainer.addSubview(followersNumberLabel)
        followersContainer.addGestureRecognizer(followersTapGesture)
        
        self.addSubview(followingContainer)
        followingContainer.addSubview(followingLabel)
        followingContainer.addSubview(followingNumberLabel)
        followingContainer.addGestureRecognizer(followingTapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.avatarViewContainer.layer.masksToBounds = false
        self.avatarViewContainer.layer.cornerRadius = self.avatarViewContainer.frame.height / 2
        self.avatarViewContainer.clipsToBounds = true
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        avatarViewContainer.snp.makeConstraints { make in
            make.top.equalTo(self).offset(50).multipliedBy(0.2)
            make.centerX.equalTo(self)
            make.height.width.equalTo(150)
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(50).multipliedBy(0.2)
            make.centerX.equalTo(self)
            make.height.width.equalTo(150)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalTo(self)
            make.top.equalTo(avatarViewContainer.snp.bottom).offset(10)
        }
        
        followersIcon.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerX.equalTo(self)
            make.top.equalTo(usernameLabel.snp.bottom)
        }
        
        followersContainer.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(followersIcon.snp.leading)
            make.height.equalTo(30)
        }
        
        followersLabel.snp.makeConstraints { make in
            make.top.equalTo(followersContainer.snp.top)
            make.bottom.equalTo(followersContainer.snp.bottom)
            make.trailing.equalTo(followersContainer.snp.trailing).inset(20)
        }
        
        followersNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(followersContainer.snp.top)
            make.bottom.equalTo(followersContainer.snp.bottom)
            make.trailing.equalTo(followersLabel.snp.leading)
            make.width.equalTo(15)
        }
        
        
        followingContainer.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom)
            make.trailing.equalTo(self).inset(20)
            make.leading.equalTo(followersIcon.snp.trailing)
            make.height.equalTo(30)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(followingContainer.snp.top)
            make.bottom.equalTo(followingContainer.snp.bottom)
            make.leading.equalTo(followingNumberLabel.snp.trailing).offset(5)
        }
        
        followingNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(followingContainer.snp.top)
            make.bottom.equalTo(followingContainer.snp.bottom)
            make.leading.equalTo(followingContainer.snp.leading).offset(20)
            make.width.equalTo(15)
        }
    }
}
