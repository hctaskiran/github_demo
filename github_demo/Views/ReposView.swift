//
//  ReposView.swift
//  github_demo
//
//  Created by Haktan Can Taşkıran on 21.03.2024.
//

import SwiftUI

struct ReposView: View {
    @State private var isBottomSheetShown = false
    @State private var repos: [GitReposModel] = []
    @State private var currentRepo: GitReposModel?
    private let service = IGitService()
    
    private func getReposData() {
        Task {
            do {
                repos = try await service.getRepos()
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
            List {
                ForEach(repos) { repo in
                    VStack(alignment: .leading) {
                        Text(repo.name!)
                            .font(.headline)
                        Text(repo.fullName!)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("\(repo.description ?? "Description not found")")
                            .font(.subheadline)
                            .foregroundColor(repo.description != nil ? .purple : .secondary)
                    }.onTapGesture {
                        currentRepo = repo
                        isBottomSheetShown = true
                    }
                }.sheet(isPresented: $isBottomSheetShown){
                    if let repo = currentRepo {
                        BottomSheetView(repo: repo, isSheetShown: $isBottomSheetShown)
                    }
                }
            }
            .onAppear {
                getReposData()
            }
        }
    }



#Preview {
    ReposView()
}
//
//struct BottomSheetView: View {
//    let repo: GitReposModel
//    @Binding var isSheetShown: Bool
//
//    var body: some View {
//        VStack {
//            Text("Bottom Sheet Content")
//                .font(.headline)
//                .padding()
//
//            Button("Close") {
//                isSheetShown = false
//            }
//            .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(radius: 10)
//        .padding()
//    }
//}
