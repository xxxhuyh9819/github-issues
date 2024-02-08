//
//  DetailView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI

struct DetailView: View {
    
    var issue: GitHubIssue?
    
    init(issue: GitHubIssue? = nil) {
        self.issue = issue
    }
    
    private func formatDate(dateString: String) -> String {
        let formatterInput = DateFormatter()
        formatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let formatterOutput = DateFormatter()
        formatterOutput.dateStyle = .long
        let date = formatterInput.date(from: dateString)
        let prettyDate = formatterOutput.string(from: date!)
        return prettyDate
    }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
        
                Text(issue?.title ?? "Unknown")
                    .font(Constants.titleFont)
                    .padding(.bottom)
                
                HStack {
                    AvatarView(avatarUrl: "https://github.com/\(issue!.user.login).png")
                    VStack(alignment: .leading) {
                        Text(issue?.user.login ?? "Unknown")
                            .foregroundStyle(Constants.authorColor)
                        Text(formatDate(dateString: issue!.createdAt))
                    }
                    
                    Spacer()
                                        
                    Link(destination: URL(string: issue!.htmlUrl)!, label: {
                        Image(systemName: "safari")
                            .foregroundStyle(issue?.state == "open" ? .red : .green)
                            .padding(.trailing)
                            .imageScale(.large)
                    })
                    .padding(.leading, Constants.padding * 3)
                }
                
                VStack(alignment: .leading) {
                    Text("Description of Issue")
                        .font(Constants.subtitleFont)
                        .padding(.bottom)
                    ScrollView([.vertical]) {
                        Text(issue?.body ?? "Unknown")
                            .padding()
                    }
                    .border(issue?.state == "open" ? .red : .green, width: Constants.lineWidth)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom)
                Spacer()
            }
            .padding(.leading, Constants.padding * 2)
            .padding(.trailing, Constants.padding * 2)
        }
    }
}

#Preview {
    DetailView(issue: nil)
}
