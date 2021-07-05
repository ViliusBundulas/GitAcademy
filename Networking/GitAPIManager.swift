//
//  GitAPIManager.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

import Foundation
import UIKit
import Alamofire

class GitAPIManager {
    //  static let shared = GitAPIManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        
        let networkLogger = GitNetworkLogger()
        let interceptor = GitRequestInterceptor()
        
        return Session(
            configuration: configuration,
            interceptor: interceptor,
            cachedResponseHandler: responseCacher,
            eventMonitors: [networkLogger])
    }()
    
    func fetchPopularSwiftRepositories(completion: @escaping ([Repository]) -> Void) {
        searchRepositories(query: "language:Swift", completion: completion)
    }
    
    func fetchCommits(for repository: String, completion: @escaping ([Commit]) -> Void) {
        sessionManager.request(GitRouter.fetchCommits(repository))
            .responseDecodable(of: [Commit].self) { response in
                guard let commits = response.value else {
                    return
                }
                completion(commits)
            }
    }
    
    func searchRepositories(query: String, completion: @escaping ([Repository]) -> Void) {
        sessionManager.request(GitRouter.searchRepositories(query))
            .responseDecodable(of: Repositories.self) { response in
                guard let repositories = response.value else {
                    return completion([])
                }
                completion(repositories.items)
            }
    }
    
    
    func fetchAccessToken(accessCode: String, completion: @escaping (AFResult<GitHubAccessToken>) -> Void) {
        sessionManager.request(GitRouter.fetchAccessToken(accessCode))
            .responseDecodable { (response: AFDataResponse<GitHubAccessToken>) in
                guard let token = response.value else { return }
                TokenManager.shared.saveAccessToken(gitToken: token)
                completion(response.result)
            }
    }
    
    func fetchUserRepositories(completion: @escaping (AFResult<[Repository]>) -> Void) {
      sessionManager.request(GitRouter.fetchUserRepositories)
        .responseDecodable { (response: AFDataResponse<[Repository]>) in
            completion(response.result)
        }
    }
    
    func fetchUserData(completion: @escaping (AFResult<UserData>) -> Void) {
        sessionManager.request(GitRouter.fetchUserData).responseDecodable { (response: AFDataResponse<UserData>) in
            completion(response.result)
        }
    }
    
    func fetchStarredRepositories(completion: @escaping (AFResult<[Repository]>) -> Void) {
        sessionManager.request(GitRouter.fetchStarredRepositories).responseDecodable { (response: AFDataResponse<[Repository]>) in
            completion(response.result)
        }
    }
}
