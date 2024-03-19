//
//  UserBioSocialSubview.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 19.03.2024.
//

import Foundation
import SwiftUI


struct UserBioSocial: View {
    @State private var user: GitUser?
    var body: some View {
        VStack(spacing: 20) {
            
            if user?.bio != nil {
                Text(user?.bio ?? "Bio ")
                    .padding()
            } else {
                Text("No Bio Found")
            }
            
            if user?.blog != nil {
                HStack {
                    Image(systemName: "network")
                    Text(user?.blog ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("No Website found")
            }
            
            if user?.twitterUsername != nil {
                HStack {
                    Text("X")
                    Text(user?.twitterUsername ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
            } else {
                Text("No Twitter Found")
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}
