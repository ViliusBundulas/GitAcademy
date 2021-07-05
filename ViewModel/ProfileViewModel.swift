//
//  ProfileViewModel.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-30.
//

import Foundation
import UIKit
import Kingfisher


class ProfileViewModel {
    private let gitApiManager: GitAPIManager
    private let tokenManager: TokenManager
    
    init(gitApiManager: GitAPIManager, tokenManager: TokenManager) {
        self.gitApiManager = gitApiManager
        self.tokenManager = tokenManager
    }
    
    var item = Observable<UserData?>(nil)
    var avatarImage = Observable<UIImage?>(nil)
    var repositories = Observable<[Repository]?>(nil)
    var isLoggedIn = Observable<Bool?>(nil)
    
    func getUserData() {
        self.gitApiManager.fetchUserData { result in
            switch result {
            case .success(let result):
                self.item.value = result
                self.downloadImage(with: result.avatarURL)
            case .failure:
                print("failed to get user data")
            }
        }
    }
    
    func getUserRepositories() {
        self.gitApiManager.fetchUserRepositories { result in
            switch result {
            case .success(let result):
                self.repositories.value = result
            case .failure:
                print("Failed to get user repositories")
            }
        }
    }
    
    func getUserStarredRepositories() {
        self.gitApiManager.fetchUserRepositories { result in
            switch result {
            case .success(let result):
                print("This is my starred repositories count number --> \(result.count)")
                print(result)
            case .failure:
                print("Failed to get starred repositories")
            }
        }
    }
    
    func downloadImage(with urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                self.avatarImage.value = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
