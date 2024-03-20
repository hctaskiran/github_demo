//
//  UserProfilePhotoSubview.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 19.03.2024.
//

import Foundation
import SwiftUI

struct ProfilePicture: View {
    let user: GitUser?
    
    var body: some View {
        AsyncImage(url: URL(string: user?.avatarURL ?? " " )) {image in
            image
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                
        } placeholder: {
            Circle()
                .foregroundColor(.secondary)
            
        }.frame(width: 120, height: 120)
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}
