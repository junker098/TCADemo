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
    
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCADemoArchitectureApp.store)
        }
    }
}
