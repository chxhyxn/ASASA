//
//  ContentView.swift
//  ASASA
//
//  Created by Sean Cho on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel(currentScreen: .learn)
    
    var body: some View {
        VStack {
            switch viewModel.currentScreen {
            case .learn:
                LearnView()
            case .feed:
                LearnView()
            case .camera:
                LearnView()
            case .profile:
                LearnView()
            }
            HStack {
                Button(action: {
                    // Action for book.circle
                }) {
                    Image(systemName:  viewModel.currentScreen == .learn ?
                          "book.circle.fill":
                            "book.circle")
                        .font(.largeTitle)
                }
                
                Button(action: {
                    // Action for magnifyingglass.circle
                }) {
                    Image(systemName:  viewModel.currentScreen == .feed ?
                          "magnifyingglass.circle.fill":
                            "magnifyingglass.circle"
                    )
                        .font(.largeTitle)
                }
                
                Button(action: {
                    // Action for camera.circle
                }) {
                    Image(systemName:  viewModel.currentScreen == .camera ?
                          "camera.circle.fill":
                            "camera.circle"
                    )
                        .font(.largeTitle)
                }
                
                Button(action: {
                    // Action for person.crop.circle
                }) {
                    Image(systemName:  viewModel.currentScreen == .profile ?
                          "person.crop.circle.fill":
                            "person.crop.circle"
                    )
                        .font(.largeTitle)
                }
                
                Button(action: {
                    // Action for ellipsis.circle
                }) {
                    // ellipsis.circle.fill
                    Image(systemName: "ellipsis.circle")
                        .font(.largeTitle)
                }
            }
        }
    }
}
