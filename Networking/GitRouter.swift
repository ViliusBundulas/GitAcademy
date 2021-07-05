//
//  GitRouter.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

import Foundation
import Alamofire

enum GitRouter {
    case fetchUserRepositories
    case searchRepositories(String)
    case fetchCommits(String)
    case fetchAccessToken(String)
    case fetchStarredRepositories
    case fetchUserData
    
    var baseURL: String {
        switch self {
        case .fetchUserRepositories, .searchRepositories, .fetchCommits, .fetchUserData, .fetchStarredRepositories:
            return "https://api.github.com"
        case .fetchAccessToken:
            return "https://github.com"
        }
    }
    
    var path: String {
        switch self {
        case .fetchUserRepositories:
            return "/user/repos"
        case .searchRepositories:
            return "/search/repositories"
        case .fetchCommits(let repository):
            return "/repos/\(repository)/commits"
        case .fetchAccessToken:
            return "/login/oauth/access_token"
        case .fetchUserData:
            return "/user"
        case .fetchStarredRepositories:
            return "/user/starred"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchUserRepositories:
            return .get
        case .searchRepositories:
            return .get
        case .fetchCommits:
            return .get
        case .fetchAccessToken:
            return .post
        case .fetchUserData:
            return .get
        case .fetchStarredRepositories:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .fetchStarredRepositories:
            return ["per_page": "100"]
        case .fetchUserData:
            return ["per_page": "100"]
        case .fetchUserRepositories:
            return ["per_page": "100"]
        case .searchRepositories(let query):
            return ["sort": "stars", "order": "desc", "page": "1", "q": query]
        case .fetchCommits:
            return nil
        case .fetchAccessToken(let accessCode):
            return [
                "client_id": GitHubConstants.clientID,
                "client_secret": GitHubConstants.clientSecret,
                "code": accessCode
            ]
        }
    }
}

// MARK: - URLRequestConvertible
extension GitRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        if method == .get {
            request = try URLEncodedFormParameterEncoder()
                .encode(parameters, into: request)
        } else if method == .post {
            request = try JSONParameterEncoder().encode(parameters, into: request)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        return request
    }
}
