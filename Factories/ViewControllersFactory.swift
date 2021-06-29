//
//  ViewControllersFactory.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-18.
//

import Foundation

protocol ViewControllersFactory {
    func makeLoginViewController() -> LoginViewController
    func makeTestViewController() -> TestViewController
}

extension DependencyContainer: ViewControllersFactory {
    func makeLoginViewController() -> LoginViewController {
        let viewModel = LoginViewModel(gitApiManager: gitApiManager)
        return LoginViewController(viewModel: viewModel)
    }
    
    func makeTestViewController() -> TestViewController {
        return TestViewController()
    }
    
    
}
