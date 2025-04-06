//
//  PhotosView.swift
//  ASASA
//
//  Created by Sean Cho on 4/6/25.
//


import SwiftUI

struct PhotosView: View {
    // 표시할 이미지 이름(또는 URL) 배열
    private let photos: [String] = [
        "image1", "image2", "image3",
        "image4", "image5", "image6",
        "image7", "image8", "image9"
    ]
    
    // 3열 그리드 예시
    private let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(photos, id: \.self) { photo in
                    // 만약 로컬 에셋(Assets.xcassets) 이미지를 사용한다면
                    Image(photo)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fill)
                        .clipped()
                    
                    // 만약 URL 이미지를 사용하고 싶다면(예: iOS 15+ AsyncImage):
                    /*
                    AsyncImage(url: URL(string: photo)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fill)
                    .clipped()
                    */
                }
            }
        }
    }
}
