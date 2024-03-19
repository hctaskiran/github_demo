//
//  ContentView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    private func getUserData() {
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
    
    @State private var user: GitUser?
    @State private var followers: GitFollowers?
    @State private var showFollowers = false
    @State var username: String = ""
    let service = IGitService()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProfilePicture()
                    
                UserNameLocationFollowers()
                    
                UserBioSocial()
                    
                    Spacer()                    
                }
            }.onAppear {
                getUserData()
            }
        }
    }



#Preview {
    ContentView()
}
