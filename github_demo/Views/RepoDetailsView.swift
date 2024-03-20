//
//  RepoDetailsView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 21.03.2024.
//

import Foundation
import SwiftUI

struct BottomSheetView: View {
    let repo: GitReposModel
    @Binding var isSheetShown: Bool

    var body: some View {
        VStack {
            Text("Bottom Sheet Content")
                .font(.headline)
                .padding()

            Button("Close") {
                isSheetShown = false
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

