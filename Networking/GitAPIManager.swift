//
//  GitAPIManager.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

import Foundation
import Alamofire

class GitAPIManager {
  static let shared = GitAPIManager()

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


  func fetchAccessToken(accessCode: String, completion: @escaping (Bool) -> Void) {
    sessionManager.request(GitRouter.fetchAccessToken(accessCode))
      .responseDecodable(of: GitHubAccessToken.self) { response in
        guard let token = response.value else {
          return completion(false)
        }
        TokenManager.shared.saveAccessToken(gitToken: token)
        completion(true)
      }
  }

  func fetchUserRepositories(completion: @escaping ([Repository]) -> Void) {
    sessionManager.request(GitRouter.fetchUserRepositories)
      .responseDecodable(of: [Repository].self) { response in
        guard let repositories = response.value else {
          return completion([])
        }
        completion(repositories)
      }
  }
}
