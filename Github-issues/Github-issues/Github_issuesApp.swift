//
//  Github_issuesApp.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/7.
//

import SwiftUI

@main
struct Github_issuesApp: App {
    var body: some Scene {
        WindowGroup {
            GithubTabView()
            // default font
            // src: https://stackoverflow.com/questions/70981389/how-to-center-a-scrollable-text-in-swiftui
                .environment(\.font, Constants.normalFont)
        }
    }
}
