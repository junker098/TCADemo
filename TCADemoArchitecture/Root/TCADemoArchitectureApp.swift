//
//  TCADemoArchitectureApp.swift
//  TCADemoArchitecture
//
//  Created by Yuriy on 14.02.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCADemoArchitectureApp: App {
    
//    static let store = Store(initialState: CounterFeature.State()) {
//        CounterFeature()
//            ._printChanges()
//    }
    
    static let store = Store(initialState: AppTabFeature.State()) {
        AppTabFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            AppTabView(store: TCADemoArchitectureApp.store)
          //  CounterView(store: TCADemoArchitectureApp.store)
        }
    }
}
