

struct Repository: Codable {
    let name: String
    let fullName: String
    let description: String?
    let language: String
    let stars: Int
    let owner: RepositoryOwner
    
    enum CodingKeys: String, CodingKey {
        case owner
        case language
        case name
        case description
        case fullName = "full_name"
        case stars = "stargazers_count"
    }
}

struct RepositoryOwner: Codable {
    let login: String
}


