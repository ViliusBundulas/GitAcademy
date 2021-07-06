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
        let loginViewController = viewControllersFactory.makeLoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func startProfileViewController() {
        let vc = viewControllersFactory.makeProfileViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startRepositoriesViewController() {
        let vc = viewControllersFactory.makeRepositoriesViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
    
    func startFollowersListViewController() {
        let vc = viewControllersFactory.makeFollowersListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startFollowingListViewController() {
        let vc = viewControllersFactory.makeFollowingListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
