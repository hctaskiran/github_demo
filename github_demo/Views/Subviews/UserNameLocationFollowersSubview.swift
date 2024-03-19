//
//  UserNameLocationFollowersSubview.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 19.03.2024.
//

import Foundation
import SwiftUI


struct UserNameLocationFollowers: View {
    @State private var user: GitUser?
    var body: some View {
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
    }
}
