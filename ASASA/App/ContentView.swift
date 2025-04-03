import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel(currentScreen: .learn)
    @State private var showMoreSheet = false
    
    var body: some View {
        ZStack {
            // Main content area
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
                        viewModel.currentScreen = .camera
                    }) {
                        Image(systemName: viewModel.currentScreen == .camera ?
                              "camera.circle.fill" :
                              "camera.circle")
                        .font(.largeTitle)
                    }

                    Spacer()

                    Button(action: {
                        viewModel.currentScreen = .profile
                    }) {
                        Image(systemName: viewModel.currentScreen == .profile ?
                              "person.crop.circle.fill" :
                              "person.crop.circle")
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
