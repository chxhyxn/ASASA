//
//  ProfileView.swift
//  ASASA
//
//  Created by Sean Cho on 4/5/25.
//

import SwiftUI

struct ProfileView: View {
    
    // 친구 추천용 간단한 모델
    struct FriendSuggestion: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
    }
    
    // 샘플 친구 목록
    private let friendSuggestions = [
        FriendSuggestion(name: "엄준식", imageName: "person.circle"),
        FriendSuggestion(name: "엄충환", imageName: "person.circle"),
        FriendSuggestion(name: "엄현숙", imageName: "person.circle"),
        FriendSuggestion(name: "엄민재", imageName: "person.circle")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // 프로필 상단 정보
                    VStack(spacing: 8) {
                        // 실제 앱에서는 URL 이미지나 사용자 커스텀 이미지를 사용할 수 있습니다.
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        
                        Text("Sean Cho")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("흠흠")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        // 간단한 통계 정보 예시
                        HStack(spacing: 16) {
                            VStack {
                                Text("학습 과정")
                                    .font(.caption)
                                Text("1")
                                    .font(.headline)
                            }
                            VStack {
                                Text("팔로잉")
                                    .font(.caption)
                                Text("231")
                                    .font(.headline)
                            }
                            VStack {
                                Text("팔로워")
                                    .font(.caption)
                                Text("213312")
                                    .font(.headline)
                            }
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                    
                    Divider()
                    
                    // 친구 추천 섹션
                    VStack(alignment: .leading, spacing: 8) {
                        Text("친구 추천")
                            .font(.headline)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(friendSuggestions) { friend in
                                    VStack {
                                        Image(systemName: friend.imageName)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .padding()
                                        
                                        Text(friend.name)
                                            .font(.subheadline)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 80)
                                        
                                        Button("팔로우하기") {
                                            // 팔로우 로직
                                        }
                                        .font(.caption)
                                        .padding(4)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(4)
                                    }
                                    .frame(width: 100)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
        }
    }
}
