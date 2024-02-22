//
//  ContactsFeature.swift
//  TCADemoArchitecture
//
//  Created by Yuriy on 22.02.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ContactsFeature {
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                //TODO: Handle action
                return .none
            }
        }
    }
}


