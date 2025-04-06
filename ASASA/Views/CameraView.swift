//
//  CameraView.swift
//  ASASA
//
//  Created by Sean Cho on 4/6/25.
//

import SwiftUI

struct CameraView: View {
    @Environment(ContentViewModel.self) var viewModel
    
    var body: some View {
        ZStack {
            Color.black // Camera background
                .ignoresSafeArea()
            if viewModel.showCameraViewContents {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.closeCamera()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    Text("Camera View")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    // Camera controls would go here
                    HStack {
                        Spacer()
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                            )
                        Spacer()
                    }
                    .padding(.bottom)
                }
                .opacity(viewModel.cameraViewContentsOpacity)
            }
        }
    }
}
