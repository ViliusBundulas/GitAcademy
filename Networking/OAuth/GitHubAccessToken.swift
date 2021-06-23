//
//  GitHubAccessToken.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

struct GitHubAccessToken: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
