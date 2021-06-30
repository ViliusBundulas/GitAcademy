//
//  User.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-29.
//

import Foundation

struct UserData: Decodable {
    let login: String
    let location: String
    let followers: Int
    let following: Int
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case location
        case followers
        case following
        case avatarURL = "avatar_url"
    }
}
