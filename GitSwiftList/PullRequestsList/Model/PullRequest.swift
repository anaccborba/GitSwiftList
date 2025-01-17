//
//  PullRequest.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

struct PullRequest: Codable {
    let id: Int
    let title: String
    let url: String
    let user: User
    let body: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case url = "html_url"
        case user
        case body
    }
}

struct User: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
