//
//  MainCoordinator.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-16.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators = [CoordinatorProtocol]()
    private let viewControllersFactory: ViewControllersFactory
    
    init(navigationController: UINavigationController,
        viewControllersFactory: ViewControllersFactory) {
        self.navigationController = navigationController
        self.viewControllersFactory = viewControllersFactory
    }
    
    func start() {
        let viewController = LoginViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
