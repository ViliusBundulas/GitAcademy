//
//  ViewControllersFactory.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-18.
//

import Foundation

protocol ViewControllersFactory {
    func makeLoginViewController() -> LoginViewController
    func makeProfileViewController() -> ProfileViewController
}

extension DependencyContainer: ViewControllersFactory {
    func makeLoginViewController() -> LoginViewController {
        let viewModel = LoginViewModel(gitApiManager: gitApiManager)
        return LoginViewController(viewModel: viewModel)
    }
    
    func makeProfileViewController() -> ProfileViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return ProfileViewController(viewModel: viewModel)
    }
    
    
}
