//
//  GithubListView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI
import UIKit

struct OpenIssueListView: View {
    
    @StateObject var viewModel = IssueViewModel(status: "open")
    // GitHubClient.githubUrl + GitHubClient.repoUrl
    var body: some View {
        NavigationStack {
            HStack {
                Text("Go To Repository:")
                Link(destination: URL(string: GitHubClient.repoUrl)!, label: {
                    Image(systemName: "safari")
                        .foregroundStyle(.openIssue)
                        .padding(.trailing)
                        .imageScale(.large)
                })
            }
            .padding(.top)
            List(viewModel.issues, id: \.htmlUrl, rowContent: { issue in
                ListCellView(title: issue.title ?? "???",
                             author: issue.user.login,
                             avatarUrl: "https://github.com/\(issue.user.login).png")
                // hide NavigationLink arrow
                // https://stackoverflow.com/questions/58333499/swiftui-navigationlink-hide-arrow
                    .background(
                        NavigationLink("", destination: DetailView(issue: issue))
                            .opacity(0)
                    )
            })
            .listStyle(GroupedListStyle())
            .navigationTitle("Open")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.openIssue, for: .navigationBar)
            
        }
        .task {
            viewModel.getIssues(status: viewModel.status)
        }
    }
}

#Preview {
    OpenIssueListView()
}
