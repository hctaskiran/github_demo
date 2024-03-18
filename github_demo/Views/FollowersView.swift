//
//  FollowersView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import SwiftUI

struct FollowersView: View {
    @State private var followers: [GitFollowers] = []
    let service = IGitService()
    
    var body: some View {
        VStack{
            if followers.isEmpty {
                Text("Loading...")
            } else {
                List {
                    ForEach(followers) { item in
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: item.avatarURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.secondary)
                                    
                            }.frame(width: 30, height: 30)
                                    
                            
                            Text(item.login)
                        }
                    }
                }
            }
        }.onAppear{
            getFollowersData()
        }
    }
    
    private func getFollowersData() {
        Task {
            do {
                followers = try await service.getFollowers()
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
    FollowersView()
}
