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
    
    let iconContainerView: UIView
    let iconView: UIImageView
    let listNameLabel: UILabel
    let countLabel: UILabel
    
    override init() {
        self.iconContainerView = UIView()
        self.iconContainerView.layer.cornerRadius = 5
        self.iconContainerView.clipsToBounds = true
        self.iconView = UIImageView()
        self.listNameLabel = UILabel()
        self.countLabel = UILabel()
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup views
    
    override func setupView() {
        super.setupView()
        
        makeRoundedCornerEdges()
        
        self.addSubview(listNameLabel)
        self.addSubview(countLabel)
        self.addSubview(iconContainerView)
        iconContainerView.addSubview(iconView)
    }
    
    //MARK: - setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
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

extension RepositoryListView {
    
    func makeRoundedCornerEdges() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
