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
    
    init(currentScreen: ViewScreen) {
        self.currentScreen = .learn
    }
}
