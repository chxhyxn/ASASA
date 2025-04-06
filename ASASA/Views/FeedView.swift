//
//  FeedView.swift
//  ASASA
//
//  Created by Sean Cho on 4/5/25.
//

import SwiftUI

struct FeedView: View {
    
    // 예시로 사용할 피드 아이템 모델
    struct FeedItem: Identifiable {
        let id = UUID()
        let message: String
        let date: Date
    }
    
    // 샘플 데이터
    private let feedItems = [
        FeedItem(message: "피드 1", date: Date()),
        FeedItem(message: "피드 2", date: Date().addingTimeInterval(-3600))
    ]
    
    var body: some View {
        NavigationView {
            List(feedItems) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.message)
                        .font(.body)
                    Text(item.date, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    // 좋아요 등등
                    Button(action: {
                        // 좋아요 로직
                    }) {
                        Text("좋아요 등등")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 4)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Feed")
        }
    }
}
