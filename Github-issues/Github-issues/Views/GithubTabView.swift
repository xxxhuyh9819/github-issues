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
    }
}

#Preview {
    GithubTabView()
}
