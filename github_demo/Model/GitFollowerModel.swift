//
//  GitFollowerModel.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import Foundation

struct GitFollowers: Identifiable, Codable {
    let login: String
    let avatarURL: String
    let id: Int

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarURL = "avatar_url"
    }
}
