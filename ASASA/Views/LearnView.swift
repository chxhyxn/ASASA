//
//  LearnView.swift
//  ASASA
//
//  Created by Sean Cho on 4/5/25.
//


import SwiftUI

// MARK: - LearnView
struct LearnView: View {
    
    // 예시로 사용할 데이터 모델
    struct SectionProgress: Identifiable {
        let id = UUID()
        let title: String
        let completed: Int
        let total: Int
    }
    
    // 샘플 데이터
    private let sections = [
        SectionProgress(title: "섹션 1", completed: 7, total: 10),
        SectionProgress(title: "섹션 2", completed: 30, total: 30),
        SectionProgress(title: "섹션 3", completed: 30, total: 30),
        SectionProgress(title: "섹션 4", completed: 30, total: 60),
        SectionProgress(title: "섹션 5", completed: 24, total: 51),
        SectionProgress(title: "섹션 6", completed: 26, total: 52),
        SectionProgress(title: "섹션 7", completed: 5, total: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(sections) { section in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(section.title)
                                .font(.headline)
                            
                            // 진행 상황을 텍스트로 표시
                            Text("\(section.completed) / \(section.total)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            // 실제 디자인에서는 ProgressView, 커스텀 Progress Bar 등으로 구현 가능
                            ProgressView(value: Double(section.completed),
                                         total: Double(section.total))
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("Learn")
        }
    }
}
