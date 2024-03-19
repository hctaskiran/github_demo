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
            
                Text(user?.bio ?? "Bio ")
                    .padding()
            
            
                HStack {
                    Image(systemName: "network")
                    Text(user?.blog ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading)
            
                HStack {
                    Text("X")
                    Text(user?.twitterUsername ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}
