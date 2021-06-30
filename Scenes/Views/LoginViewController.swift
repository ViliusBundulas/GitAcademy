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
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - UI elements
    
    private lazy var logoView: UIImageView = {
        configureLogoImageView()
    }()
    
    private var signInButton = CustomButton(
        text: "Sign In",
        backgroundColor: .black,
        cornerRadius: 25,
        buttonAlpha: 0.8,
        textColor: .white,
        target: self, action: #selector(signInPressed), controlEvent: .touchUpInside
    )
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        
        return indicator
    }()
    
    //MARK: - Button actions
    
    @objc func signInPressed(sender: UITapGestureRecognizer) {
        self.viewModel.getGitHubIdentity()
    }
    
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        bindViewModel()
        
        view.addSubview(signInButton)
        view.addSubview(logoView)
        view.addSubview(activityIndicatorView)
    }
    
    //MARK: - Observable data binding
    
    private func bindViewModel() {
        viewModel.onDismiss = { [unowned self] in
            coordinator?.startTestViewController()
        }
        
        viewModel.isLoading.bind { isLoading in
            switch isLoading {
            case true:
                self.activityIndicatorView.startAnimating()
            case false:
                self.activityIndicatorView.stopAnimating()
            }
        }
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
            make.bottom.equalTo(signInButton.snp.bottom).inset(150)
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
    }
}

    //MARK: - Helpers

private extension LoginViewController {
    
    func configureLogoImageView() -> UIImageView {
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
        logoImageView.contentMode = .scaleAspectFit
        
        return logoImageView
    }
}

            

