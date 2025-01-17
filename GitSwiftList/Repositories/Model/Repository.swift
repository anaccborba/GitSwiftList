//
//  Repository.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

struct Repository: Codable {
    let id: Int
    let name: String
    let owner: Owner
    let description: String?
    let url: String
    let starsCount: Int
    let forksCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case url
        case starsCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}

struct Owner: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
