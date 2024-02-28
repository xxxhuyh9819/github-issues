//
//  InfoTabViewModel.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/28.
//

import Foundation
class InfoTabViewModel: ObservableObject {
    @Published var openIssues = [GitHubIssue]()
    @Published var closedIssues = [GitHubIssue]()
    
    init() {
        Task {
            try await getOpenIssues()
            try await getClosedIssues()
        }
    }
    
    var numOfIssues: Int {
        return openIssues.count + closedIssues.count
    }
    
    @MainActor
    func getOpenIssues() async throws {
        try await self.openIssues = GitHubClient.sharedInstance.fetchIssues(status: "open")
    }
    
    @MainActor
    func getClosedIssues() async throws {
        try await self.closedIssues = GitHubClient.sharedInstance.fetchIssues(status: "closed")
    }
    
}
