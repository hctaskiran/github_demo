//
//  GitService.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import Foundation
protocol GitService {
    func getUser() async throws -> GitUser
    func getFollowers() async throws -> [GitFollowers]
    func getFollowings() async throws -> [GitFollowings]
    func getRepos() async throws -> [GitReposModel]
}

class IGitService: GitService {
    
    func getRepos() async throws -> [GitReposModel] {
        let endpoint = "https://api.github.com/users/hctaskiran/repos"
        
        guard let url = URL(string: endpoint) else {
            throw GitError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([GitReposModel].self, from: data)
        } catch {
            throw GitError.invalidData
        }
    }
    
    func getUser() async throws -> GitUser {
        let endpoint = "https://api.github.com/users/hctaskiran"
        
        guard let url = URL(string: endpoint) else {
            throw GitError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(GitUser.self, from: data)
        } catch {
            throw GitError.invalidData
        }
    }
    
    func getFollowers() async throws -> [GitFollowers] {
        let endpoint = "https://api.github.com/users/hctaskiran/followers"
        
        guard let url = URL(string: endpoint) else {
            throw GitError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([GitFollowers].self, from: data)
        } catch {
            throw GitError.invalidData
        }
    }
    
    func getFollowings() async throws -> [GitFollowings] {
        let endpoint = "https://api.github.com/users/hctaskiran/following"
        
        guard let url = URL(string: endpoint) else {
            throw GitError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([GitFollowings].self, from: data)
        } catch {
            throw GitError.invalidData
        }
    }
}
