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
    
    init(gitApiManager: GitAPIManager) {
        self.gitApiManager = gitApiManager
    }
    
    var item = Observable<UserData?>(nil)
    var avatarImage = Observable<UIImage?>(nil)
    
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
    
    func downloadImage(`with` urlString : String){
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
