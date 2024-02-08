//
//  AvatarView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/8.
//

import SwiftUI

struct AvatarView: View {
    
    var avatarUrl: String
    
    init(avatarUrl: String) {
        self.avatarUrl = avatarUrl
    }
    
    var body: some View {
        AsyncImage(url: URL(string: avatarUrl))
            .scaledToFit()
            .frame(width: Constants.imageSize, height: Constants.imageSize)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding(.trailing, Constants.padding)
    }
}

#Preview {
    AvatarView(avatarUrl: "")
}
