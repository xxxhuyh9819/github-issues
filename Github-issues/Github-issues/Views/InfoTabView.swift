//
//  InfoTabView.swift
//  Github-issues
//
//  Created by Yunhao Hu on 2024/2/28.
//

import SwiftUI

struct InfoTabView: View {
    
    @StateObject var viewModel: InfoTabViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("ISSUE INFO")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            
            ScrollView {
                Text("Total number of issues: \(viewModel.numOfIssues)")
                    .padding(.bottom)
                
                // src: https://sarunw.com/posts/swiftui-gauge/
                VStack(alignment: .center) {
                    Label("Open issues", systemImage: "envelope.open.fill")
                        .fontWeight(.bold)
                        .padding(.bottom, 70)
                    
                    Gauge(value: Double(viewModel.openIssues.count), in: 0...Double(viewModel.numOfIssues)) {

                    } currentValueLabel: {
                        Text(viewModel.openIssues.count, format: .number)
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("\(viewModel.numOfIssues)")
                    }
                    .scaleEffect(3)
                    .gaugeStyle(.accessoryCircular)
                    .padding(.bottom)
                }
                
                .padding(.bottom, 32)
                
                Divider()
                
                VStack(alignment: .center) {
                    Label("Closed issues", systemImage: "envelope.fill")
                        .fontWeight(.bold)
                        .padding(.bottom, 70)
                    
                    Gauge(value: Double(viewModel.closedIssues.count), in: 0...Double(viewModel.numOfIssues)) {

                    } currentValueLabel: {
                        Text(viewModel.closedIssues.count, format: .number)
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("\(viewModel.numOfIssues)")
                    }
                    .scaleEffect(3)
                    .gaugeStyle(.accessoryCircular)
                    .padding(.bottom)
                }
                
                .padding(.bottom, 32)
            }
            
        }
        .padding()
    }
}

#Preview {
    InfoTabView(viewModel: InfoTabViewModel())
}
