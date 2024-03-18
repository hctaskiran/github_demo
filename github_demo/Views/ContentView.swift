//
//  ContentView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GitUser?
    @State private var followers: GitFollowers?
    @State private var showFollowers = false
    let service = IGitService()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                    AsyncImage(url: URL(string: user?.avatarURL ?? " ")) {image in
                        image
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .foregroundColor(.secondary)
                            
                    }.frame(width: 120, height: 120)
                    
                    VStack(spacing: 10) {
                        
                        Text(user?.name ?? "Name")
                            .bold()
                            .font(.title3)
                        
                        HStack {
                            Text(user?.login ?? "Username")
                            Text("·")
                            Text(user?.location ?? "Location")
                        }.font(.subheadline).foregroundColor(.gray)
                        
                        HStack(spacing: 100) {
                            NavigationLink(destination: FollowersView()) {
                                Text("Followers: \(user?.followers ?? 0)").foregroundStyle(.black)
                            }
                            
                            Text("Following: \(user?.following ?? 0)")
                        }
                    }
                    
                    Text(user?.bio ?? "Bio ")
                        .padding()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "network")
                            Text(user?.blog ?? "")
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("X")
                            Text(user?.twitterUsername ?? "")
                        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
                        
                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                    
                    Spacer()
                    
                }.onAppear{
                    getUserData()
            }
        }
    }
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
}



#Preview {
    ContentView()
}




