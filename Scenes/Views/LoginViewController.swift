//
//  LoginViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-15.
//

import UIKit

class LoginViewController: BaseViewController {
    
    //MARK: - Dependencies
    
    weak var coordinator: MainCoordinator?
    let apiManager = SignInViewModel()
    
    //MARK: - UI elements
    
    private lazy var logoView: UIImageView = {
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
//        logoImageView.alpha = logoImageAlpha
        logoImageView.contentMode = .scaleAspectFit
        
        return logoImageView
    }()
    
    private var signInButton = CustomButton(
        text: "Sign In",
        backgroundColor: .black,
        cornerRadius: 25,
        buttonAlpha: 0.8,
        textColor: .white,
        target: self, action: #selector(signInPressed), controlEvent: .touchUpInside
    )
    
    //MARK: - Button actions
    
    @objc func signInPressed(sender: UIButton!) {
        self.apiManager.getGitHubIdentity()
    }
    
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        
        view.addSubview(signInButton)
        view.addSubview(logoView)
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(100)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.centerX.equalTo(view)
            make.bottom.equalTo(signInButton.snp.bottom).inset(100)
        }
    }
}

            

