//
//  ListCell.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI

struct ListCellView: View {
    
    var title: String
    var author: String
    var avatarUrl: String
    
    init(title: String, author: String, avatarUrl: String) {
        self.title = title
        self.author = author
        self.avatarUrl = avatarUrl
    }
    
    var body: some View {
        HStack {
            AvatarView(avatarUrl: avatarUrl)
            VStack(alignment: .leading) {
                Text(self.title)
                    .frame(height: Constants.textHeight)
                    .font(Constants.titleFont)
                Text("@\(self.author)")
                    .frame(height: Constants.textHeight)
                    .foregroundStyle(Constants.authorColor)
            }
        }
    }
}

#Preview {
    ListCellView(title: "title", author: "author", avatarUrl: "https://github.com/xxxhuyh9819.png")
}
