//
//  OpenIssueViewController.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import Foundation

@MainActor
class IssueViewModel: ObservableObject {
    
    @Published var issues: [GitHubIssue] = []
    @Published var selectedIssue: GitHubIssue?
    
    var status: String
    
    init(status: String) {
        self.status = status
    }

    func getIssues(status: String) {
        Task {
            do {
                issues = try await GitHubClient.sharedInstance.fetchIssues(status: self.status)
            } catch {
                if let error = error as? Errors {
                    switch error {
                    case .invalidURL:
                        print("Invalid URL")
                    case .badResponse:
                        print("Bad Response!")
                    }
                } else {
                    print("Unknown Error!")
                }
            }
        }
    }
}
