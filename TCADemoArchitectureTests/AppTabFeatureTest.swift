//
//  AppTabFeatureTest.swift
//  TCADemoArchitectureTests
//
//  Created by Yuriy on 21.02.2024.
//

import ComposableArchitecture
import XCTest
@testable import TCADemoArchitecture

@MainActor
class AppTabFeatureTest: XCTestCase {
    
    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppTabFeature.State()) {
            AppTabFeature()
        }
        
        await store.send(.tab1(.incrementButtonTapped)) { //state in
            //state.tab1.count = 1
            $0.tab1.count = 1
        }
    }
}

