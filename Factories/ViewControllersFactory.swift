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
    func makeFollowersListViewController() -> FollowersListViewController
    func makeFollowingListViewController() -> FollowingListViewController
    func makeStarredRepositoriesViewController() -> StarredRepositoriesViewController
    func makeRepositoryViewController(repository: Repository) -> RepositoryViewController
}

extension DependencyContainer: ViewControllersFactory {
    func makeRepositoriesViewController() -> RepositoriesViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return RepositoriesViewController(viewModel: viewModel)
    }
    
    func makeLoginViewController() -> LoginViewController {
        let viewModel = LoginViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return LoginViewController(viewModel: viewModel)
    }
    
    func makeProfileViewController() -> ProfileViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return ProfileViewController(viewModel: viewModel)
    }
    
    func makeFollowersListViewController() -> FollowersListViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return FollowersListViewController(viewModel: viewModel)
    }
    
    func makeFollowingListViewController() -> FollowingListViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return FollowingListViewController(viewModel: viewModel)
    }
    
    func makeStarredRepositoriesViewController() -> StarredRepositoriesViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        return StarredRepositoriesViewController(viewModel: viewModel)
    }
    
    func makeRepositoryViewController(repository: Repository) -> RepositoryViewController {
        let viewModel = ProfileViewModel(gitApiManager: gitApiManager, tokenManager: tokenManager)
        viewModel.selectedUserRepository.value = repository
        return RepositoryViewController(viewModel: viewModel)
    }
}
