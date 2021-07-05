//
//  RepositoryOwner.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-07-05.
//

import Foundation

class RepositoryOwner: Decodable {
    let login: String
    
    enum CodingKeys: String, CodingKey {
        case login
    }
}
