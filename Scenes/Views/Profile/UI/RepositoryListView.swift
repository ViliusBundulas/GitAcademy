//
//  RepositoryListCell.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-04.
//

import Foundation
import UIKit

final class RepositoryListView: BaseView {
    
    //MARK: - UI elements
    
    let button: UIButton
    let iconContainerView: UIView
    let iconView: UIImageView
    let listNameLabel: UILabel
    let countLabel: UILabel
    
    override init() {
        self.iconContainerView = UIView()
        self.iconView = UIImageView()
        self.listNameLabel = UILabel()
        self.countLabel = UILabel()
        self.button = UIButton(type: .system)
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup views
    
    override func setupView() {
        super.setupView()
        
        self.addSubview(button)
        self.addSubview(iconContainerView)
        iconContainerView.addSubview(iconView)
        self.addSubview(listNameLabel)
        self.addSubview(countLabel)
    }
    
    //MARK: - setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        button.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(self)
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.height.width.equalTo(30)
            make.centerY.equalTo(self)
        }

        iconView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(iconContainerView)
            make.width.height.equalTo(18)
        }

        listNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconContainerView.snp.trailing).offset(10)
            make.trailing.equalTo(countLabel.snp.leading).offset(-10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(10)
            make.width.equalTo(30)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
        }
    }
}
