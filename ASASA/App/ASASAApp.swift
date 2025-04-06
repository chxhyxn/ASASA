//
//  ASASAApp.swift
//  ASASA
//
//  Created by Sean Cho on 4/3/25.
//

import SwiftUI

@main
struct ASASAApp: App {
    @State private var viewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
