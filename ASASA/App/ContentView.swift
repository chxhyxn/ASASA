import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel(currentScreen: .learn)
    @State private var showCamera = false
    @State private var showMoreSheet = false
    @State private var cameraViewHeight: CGFloat = 0
    @State private var showCameraViewContents = false
    @State private var cameraViewContentsOpacity: Double = 0
    
    var body: some View {
        ZStack {
            // Main content area
            switch viewModel.currentScreen {
            case .learn:
                LearnView()
            case .feed:
                FeedView()
            case .photos:
                PhotosView()
            case .profile:
                ProfileView()
            }
            
            if showMoreSheet {
                // 뒤 배경을 어둡게 하는 반투명 레이어
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showMoreSheet = false
                    }
                    .transition(.opacity) // 배경도 자연스럽게 페이드 인/아웃
            }
            
            // TabBar
            VStack(spacing: 0) {
                Spacer()
                if showMoreSheet {
                    // 실제 시트(메뉴) 부분
                    VStack(spacing: 20) {
                        Text("More Options")
                            .font(.title2)
                            .padding()
                        
                        Button("Settings") {
                            // Do something
                            showMoreSheet = false
                        }
                        
                        Button("Help") {
                            // Do something
                            showMoreSheet = false
                        }
                        
                        Button("Close") {
                            showMoreSheet = false
                        }
                    }
                    .frame(maxWidth: .infinity) // 너비를 최대로 설정
                    .background(.white)
                    .transition(.move(edge: .bottom))
                }
                
                // Bottom tab bar
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.currentScreen = .learn
                    }) {
                        Image(systemName: viewModel.currentScreen == .learn ?
                              "book.circle.fill" :
                              "book.circle")
                        .font(.largeTitle)
                    }

                    Spacer()

                    Button(action: {
                        viewModel.currentScreen = .feed
                    }) {
                        Image(systemName: viewModel.currentScreen == .feed ?
                              "magnifyingglass.circle.fill" :
                              "magnifyingglass.circle")
                        .font(.largeTitle)
                    }

                    Spacer()

                    Button(action: {
                        openCameraView()
                    }) {
                        Image(systemName: "camera.circle")
                        .font(.largeTitle)
                    }

                    Spacer()

                    Button(action: {
                        viewModel.currentScreen = .photos
                    }) {
                        Image(systemName: viewModel.currentScreen == .photos ?
                              "photo.circle.fill" :
                              "photo.circle")
                        .font(.largeTitle)
                    }

                    Spacer()

                    Button(action: {
                        showMoreSheet.toggle()
                    }) {
                        Image(systemName: showMoreSheet ? "ellipsis.circle.fill" : "ellipsis.circle")
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
            }
            
            // Camera View
            if showCamera {
                CameraView(isShowing: $showCamera,
                           viewHeight: $cameraViewHeight,
                           showContents: $showCameraViewContents,
                           contentsOpacity: $cameraViewContentsOpacity
                )
                    .frame(width: .infinity, height: cameraViewHeight)
            }
        }
        .animation(.easeInOut, value: showMoreSheet)
    }
    
    private func openCameraView() {
        showCamera = true
        withAnimation(.easeIn(duration: 0.8)) {
            cameraViewHeight = .infinity
        } completion: {
            showCameraViewContents = true
            withAnimation {
                cameraViewContentsOpacity = 1
            }
        }
    }
}
