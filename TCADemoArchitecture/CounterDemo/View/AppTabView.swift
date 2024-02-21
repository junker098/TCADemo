//
//  AppTabView.swift
//  TCADemoArchitecture
//
//  Created by Yuriy on 21.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct AppTabView: View {
    
    let store: StoreOf<AppTabFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }
            
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}

#Preview {
    AppTabView(store: Store(initialState: AppTabFeature.State(), reducer: {
        AppTabFeature()
    })
    )
}
