//
//  CounterFeature.swift
//  TCADemoArchitecture
//
//  Created by Yuriy on 14.02.2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct CounterFeature {
    struct State: Equatable {
        var count = 0
        var fact: String?
        var isLoading = false
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case resetButtonTapped
        case factButtonTapped
        case factResponse(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            case .resetButtonTapped:
                state.count = 0
                state.fact = nil
                return .none
            case .factButtonTapped:
                state.isLoading = true
                state.fact = nil
                return .run { [count = state.count] send in
                    if let url = URL(string: "http://numbersapi.com/\(count)") {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        let fact = String(decoding: data, as: UTF8.self)
                        await send(.factResponse(fact))
                    }
                }
            case .factResponse(fact: let fact):
                state.fact = fact
                state.isLoading = false
                return .none
            }
         }
    }
}
