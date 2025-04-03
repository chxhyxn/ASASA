//
//  LearnView.swift
//  ASASA
//
//  Created by Sean Cho on 4/3/25.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome to the Learning Section")
                    .font(.title)
                    .bold()

                Text("Here you can explore visual features and learn about artworks.")
                    .font(.body)

                Divider()

                ForEach(1..<6) { index in
                    VStack(alignment: .leading) {
                        Text("Painting \(index)")
                            .font(.headline)
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(12)
                        Text("Description for painting \(index). This area can include accessibility notes or historical context.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}
