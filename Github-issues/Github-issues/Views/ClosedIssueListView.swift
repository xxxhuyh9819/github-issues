//
//  ClosedIssueListView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI

struct ClosedIssueListView: View {
    
    @StateObject var viewModel = IssueViewModel(status: "closed")
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Go To Repository:")
                Link(destination: URL(string: GitHubClient.repoUrl)!, label: {
                    Image(systemName: "safari")
                        .foregroundStyle(.green)
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
            .padding(.top)
            .listStyle(GroupedListStyle())
            .navigationTitle("Closed")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.green, for: .navigationBar)
        }
        .task {
            viewModel.getIssues(status: viewModel.status)
        }
    }
}

#Preview {
    ClosedIssueListView()
}
