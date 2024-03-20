//
//  UserBioSocialSubview.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 19.03.2024.
//

import Foundation
import SwiftUI


struct UserBioSocial: View {
    let user: GitUser?
    
    var body: some View {
        VStack(spacing: 20) {
            
                Text(user?.bio ?? "")
            
                HStack {
                    Image(systemName: "network")
                    Text(user?.blog ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    let url = URL(string: user?.blog ?? " ")
                    UIApplication.shared.open(url!)
                }
            
                HStack {
                    Text("X")
                    Text(user?.twitterUsername ?? "")
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 5)
                .onTapGesture {
                    let url = URL(string: user?.twitterUsername ?? " ")
                    UIApplication.shared.open(url!)
                }
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}


