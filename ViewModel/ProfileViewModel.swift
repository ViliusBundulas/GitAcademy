//
//  ProfileViewModel.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-30.
//

import Foundation

class ProfileViewModel {
    private let gitApiManager: GitAPIManager
    
    init(gitApiManager: GitAPIManager) {
        self.gitApiManager = gitApiManager
    }
    
    var item = Observable<UserData?>(nil)
    
    func getUserData() {
        self.gitApiManager.fetchUserData { result in
            switch result {
            case .success(let result):
                self.item.value = result
                print("successully got user data: \(String(describing: self.item.value))")
            case .failure:
                print("failed to get user data")
            }
        }
    }
}
