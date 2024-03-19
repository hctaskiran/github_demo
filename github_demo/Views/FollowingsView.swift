//
//  FollowingsView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 20.03.2024.
//

import SwiftUI

struct FollowingsView: View {
    @State private var followings: [GitFollowings] = []
    private let service = IGitService()
    
    private func getFollowingsData() {
        Task {
            do {
                followings = try await service.getFollowings()
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
        VStack{
            if followings.isEmpty {
                Text("Loading...")
            } else {
                List {
                    ForEach(followings) { item in
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
            getFollowingsData()
        }
    }
}

#Preview {
    FollowingsView()
}
