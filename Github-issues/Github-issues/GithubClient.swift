//
//  GithubClient.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import Foundation

struct GitHubIssue: Codable {
    let title: String?
    let createdAt: String
    let body: String?
    let state: String
    let user: GitHubUser
    let htmlUrl: String
}

struct GithubResponse: Codable {
    let request: [GitHubIssue]
}

struct GitHubUser: Codable {
    let login: String
}

enum Errors: Error {
    case invalidURL
    case badResponse
}

class GitHubClient {
    
    // Singleton
    static let sharedInstance = GitHubClient()
    
    var openIssues: [GitHubIssue] = []
    var closedIssues: [GitHubIssue] = []
    
    var numOfIssues: Int {
        return openIssues.count + closedIssues.count
    }
    
    static let baseUrl = "https://api.github.com/repos/golang/go/"
    static let repoUrl =  "https://github.com/golang/go"
    
    private init() {}
    
    func fetchIssues(status: String) async throws -> [GitHubIssue] {
        guard let url = URL(string: GitHubClient.baseUrl + "issues?state=\(status)") else {
            throw Errors.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw Errors.badResponse
        }
        
        // Parse the JSON data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedIssues = try decoder.decode([GitHubIssue].self, from: data)
        openIssues = decodedIssues.filter({ $0.state == "open" })
        closedIssues = decodedIssues.filter({ $0.state == "closed"})
        return decodedIssues
    }
}
