//
//  GitReposModel.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 21.03.2024.
//

import Foundation

struct GitReposModel:Identifiable, Codable {
    let id: Int?
    let name, fullName: String?
    let gitReposModelPrivate: Bool?
    let htmlURL: String?
    let description, language, visibility, defaultBranch: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case gitReposModelPrivate = "private"
        case htmlURL = "html_url"
        case description, language, visibility
        case defaultBranch = "default_branch"
    }
}
