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
    func makeRepositoriesViewController() -> RepositoriesViewController
}

extension DependencyContainer: ViewControllersFactory {
    func makeRepositoriesViewController() -> RepositoriesViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return RepositoriesViewController(viewModel: viewModel)
    }
    
    func makeLoginViewController() -> LoginViewController {
        let viewModel = LoginViewModel(gitApiManager: gitApiManager)
        return LoginViewController(viewModel: viewModel)
    }
    
    func makeProfileViewController() -> ProfileViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return ProfileViewController(viewModel: viewModel)
    }
    
    
}
