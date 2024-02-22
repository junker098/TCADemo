//
//  ContactsView.swift
//  TCADemoArchitecture
//
//  Created by Yuriy on 22.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        Text(contact.name)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContactsView(store: Store(initialState: ContactsFeature.State(
        contacts: [Contact(id: UUID(), name: "Bob"),
                   Contact(id: UUID(), name: "Diego"),
                   Contact(id: UUID(), name: "Calvin"),
                   Contact(id: UUID(), name: "John"),
                   Contact(id: UUID(), name: "Bill")
                  ]
    ), reducer: {
        ContactsFeature()
    }))
}
