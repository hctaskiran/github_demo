//
//  ContentView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GitUser?
    private let service = IGitService()
    @State private var isBottomSheetShown = false
    @State private var repos: [GitReposModel] = []
    @State private var currentRepo: GitReposModel?
    
    private func getUserData() async {
        Task {
            do {
                user = try await service.getUser()
            } catch GitError.invalidData {
                print("Data not found")
            } catch GitError.invalidResponse {
                print("Reponse is not valid")
            } catch GitError.invalidURL {
                print("URL is not valid")
            } catch {
                print("unexpected error")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                ProfilePicture(user: user)
                    
                UserNameLocationFollowers(user: user)
                    
                UserBioSocial(user: user)
                
                ReposView()
                    
                Spacer()
                
            }
        }.onAppear {
            Task {
                await getUserData()
            }
        }
    }
}



#Preview {
    ContentView()
}




