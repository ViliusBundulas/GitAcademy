//
//  RepositoryOwner.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-05.
//

import Foundation

class RepositoryOwner: Decodable {
    let login: String
    let stars: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case stars = "stargazers_count"
    }
}
