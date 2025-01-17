//
//  DSProfile.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

struct DSProfile: Codable {
    let avatarUrl: String
    let username: String
    let axis: DSProfileViewAxis
}

enum DSProfileViewAxis: Codable {
    case horizontal
    case vertical
}
