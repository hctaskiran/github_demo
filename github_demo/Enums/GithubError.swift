//
//  GithubError.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import Foundation

enum GitError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
