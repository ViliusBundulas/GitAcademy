

struct Repository: Decodable {
    let name: String
    let fullName: String
    let description: String?
    let language: String
    let stars: Int
    
    enum CodingKeys: String, CodingKey {
        case language
        case name
        case description
        case fullName = "full_name"
        case stars = "stargazers_count"
    }
}
