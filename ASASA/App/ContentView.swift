import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel(currentScreen: .learn)
    @State private var showCamera = false
    @State private var showMoreSheet = false
    
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
            
            // TabBar
            VStack {
                Spacer()
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
                        withAnimation(.spring()) {
                            showCamera = true
                        }
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
                        Image(systemName: "ellipsis.circle")
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
                Color.black
                    .ignoresSafeArea(.all)
                    .transition(.move(edge: .bottom))
                CameraView(isShowing: $showCamera)
                    .transition(.move(edge: .bottom))
            }
            
            // Optional overlay: can be a custom menu or blur background, etc.
            if showMoreSheet {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showMoreSheet = false
                    }
                
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
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .shadow(radius: 10)
                .padding()
            }
        }
        .animation(.easeInOut, value: showMoreSheet)
    }
}
