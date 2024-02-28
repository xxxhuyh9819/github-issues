//
//  GithubTabView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI

struct GithubTabView: View {
    var body: some View {
        TabView {
            InfoTabView(viewModel: InfoTabViewModel())
            .tabItem {
                Text("Info")
                Image(systemName: "gauge.with.needle")
            }
            OpenIssueListView()
            .tabItem {
                Text("Open")
                Image(systemName: "envelope.open")
            }
            ClosedIssueListView()
            .tabItem {
                Text("Closed")
                Image(systemName: "envelope")
            }
        }
        .tint(.primary)
    }
}

#Preview {
    GithubTabView()
}
