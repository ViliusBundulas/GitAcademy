//
//  GitAPIMock.swift
//  GitAcademyTests
//
//  Created by Vilius Bundulas on 2021-07-08.
//

import Foundation
import Alamofire
@testable import GitAcademy

class GitAPIMock: GitAPIManagerProtocol {
    var getUserRepositories: AFResult<[Repository]>?
    var getStarredRepositories: AFResult<[Repository]>?
    var getUserData: AFResult<UserData>?
    var getFollowers: AFResult<[Follower]>?
    var getUserFollowers: AFResult<[Follower]>?
    var getUserFollowing: AFResult<[Follower]>?
    
    var fetchUserRepositoriesCalled: Bool = false
    var fetchUserStarredRepositoriesCalled: Bool = false
    var fetchUserDataCalled: Bool = false
    var fetchUserFollowersCalled: Bool = false
    var fetchUserFollowingCalled: Bool = false
    var fetchFollowersCalledWithLogin: String?
    
    func fetchUserRepositories(completion: @escaping (AFResult<[Repository]>) -> Void) {
        fetchUserRepositoriesCalled = true
        if let result = getUserRepositories {
            completion(result)
        }
    }
    
    func fetchUserData(completion: @escaping (AFResult<UserData>) -> Void) {
        fetchUserDataCalled = true
        if let result = getUserData {
            completion(result)
        }
    }
    
    func fetchStarredRepositories(completion: @escaping (AFResult<[Repository]>) -> Void) {
        fetchUserStarredRepositoriesCalled = true
        if let result = getStarredRepositories {
            completion(result)
        }
    }
    
    func fetchUserFollowers(completion: @escaping (AFResult<[Follower]>) -> Void) {
        fetchUserFollowersCalled = true
        if let result = getUserFollowers {
            completion(result)
        }
    }
    
    func fetchUserFollowing(completion: @escaping (AFResult<[Follower]>) -> Void) {
        fetchUserFollowingCalled = true
        if let result = getUserFollowing {
            completion(result)
        }
    }
    
    func fetchFollowers(of user: String, completion: @escaping (AFResult<[Follower]>) -> Void) {
        fetchFollowersCalledWithLogin = user
        if let result = getFollowers {
            completion(result)
        }
    }
}
