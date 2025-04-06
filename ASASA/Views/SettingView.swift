//
//  SettingView.swift
//  ASASA
//
//  Created by Sean Cho on 4/6/25.
//


import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List {
                    // MARK: - 계정 섹션
                    // MARK: - 크레딧 섹션
                    Section {
                        NavigationLink(destination: Text("크레딧 광고 화면")) {
                            Text("광고보고 크레딧 얻기")
                        }
                        NavigationLink(destination: Text("크레딧 구매하기 화면")) {
                            Text("크레딧 구매하기")
                        }
                    }
                    
                    // MARK: - 지원 섹션
                    Section {
                        NavigationLink(destination: Text("도움말 센터 화면")) {
                            Text("도움말 센터")
                        }
                        NavigationLink(destination: Text("피드백 화면")) {
                            Text("피드백")
                        }
                    }
                    
                    // MARK: - 하단 정책/규정
                    Section {
                        VStack {
                            NavigationLink(destination: Text("개인정보처리방침 화면")) {
                                Text("개인정보처리방침")
                            }
                        }
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 8)
                    }
                    
                    // MARK: - 로그아웃
                    Section {
                        Button(action: {
                            // 로그아웃 로직
                        }) {
                            Text("로그아웃")
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle()) // iOS 14+ 스타일
                .navigationTitle("설정")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
