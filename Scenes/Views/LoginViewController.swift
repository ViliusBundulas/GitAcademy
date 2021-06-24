//
//  LoginViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-15.
//

import UIKit

class LoginViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    let apiManager = SignInViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.apiManager.getGitHubIdentity()
            }
    }
}

