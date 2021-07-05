//
//  RepositoriesListCell.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-05.
//

import Foundation
import UIKit

class RepositoriesListCell: UITableViewCell {
    
    //MARK: - UI elements
    
    let name = UILabel()
    let repositoryDescription = UILabel()
    let starIcon = UIImageView()
    let starCountLabel = UILabel()
    let language = UILabel()
    let roundCircle = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell configuration
    
    func configureCell() {
        self.contentView.addSubview(name)
        self.contentView.addSubview(repositoryDescription)
        self.contentView.addSubview(starIcon)
        self.contentView.addSubview(starCountLabel)
        self.contentView.addSubview(language)
        self.contentView.addSubview(roundCircle)
        
        self.backgroundColor = UIColor(red: 28.0/255, green: 30.0/255, blue: 35.0/255, alpha: 1.0)
        
        self.name.textColor = .white
        self.repositoryDescription.textColor = .white.withAlphaComponent(0.7)
        self.starIcon.image = #imageLiteral(resourceName: "starred").withRenderingMode(.alwaysTemplate)
        self.starIcon.tintColor = .white.withAlphaComponent(0.7)
        self.starIcon.contentMode = .scaleAspectFit
        self.starCountLabel.textColor = .white.withAlphaComponent(0.5)
        
        setupConstrains()
    }
    
    //MARK: - Setup constrains
    
    func setupConstrains() {
        
        name.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(20)
            make.leading.equalTo(self.contentView).offset(20)
            make.trailing.equalTo(self.contentView).inset(20)
            make.height.equalTo(30)
        }
        
        repositoryDescription.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom)
            make.leading.trailing.equalTo(name)
            make.height.equalTo(30)
        }
        
        starIcon.snp.makeConstraints { make in
            make.top.equalTo(repositoryDescription.snp.bottom)
            make.leading.equalTo(name)
            make.height.width.equalTo(15)
        }
        
        starCountLabel.snp.makeConstraints { make in
            make.top.equalTo(starIcon)
            make.leading.equalTo(starIcon.snp.trailing).offset(5)
            make.height.equalTo(starIcon)
            make.width.equalTo(10)
        }
    }
}
