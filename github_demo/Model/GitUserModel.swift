//
//  GitUserModel.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import Foundation

struct GitUser: Codable {
    let login: String
    let avatarURL, url: String
    let name, bio: String
    let publicRepos, followers, following: Int
    let location: String
    let twitterUsername: String
    let blog: String

     private enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case url, name, bio
        case publicRepos = "public_repos"
        case followers, following
        case location
        case twitterUsername = "twitter_username"
        case blog
    }
    
     
}
