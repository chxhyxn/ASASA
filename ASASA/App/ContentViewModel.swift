//
//  ContentViewModel.swift
//  ASASA
//
//  Created by Sean Cho on 4/3/25.
//


import Foundation
import SwiftUI
import Observation

@Observable
class ContentViewModel {
    var currentScreen: ViewScreen = .learn
    
    var cameraViewHeight: CGFloat = 0
    var cameraViewContentsOpacity: Double = 0
    var showCameraViewContents = false
    
    func openCamera() {
        withAnimation(.easeIn(duration: 0.8)) {
            cameraViewHeight = .infinity
        } completion: {
            withAnimation {
                self.showCameraViewContents = true
                self.cameraViewContentsOpacity = 1
            }
        }
    }
    
    
    func closeCamera() {
        withAnimation {
            cameraViewContentsOpacity = 0
        }
        completion: {
            withAnimation(.easeOut(duration: 0.8)) {
                self.showCameraViewContents = false
                self.cameraViewHeight = 0
            }
        }
    }
}
