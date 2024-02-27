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
        @PresentationState var destination: Destination.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        case destination(PresentationAction<Destination.Action>)
        case deleteButtonTapped(id: Contact.ID)
        
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.destination = .addContact(
                    AddContactFeature.State(
                        contact: Contact(id: UUID(), name: "")))
                return .none
                
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                state.contacts.append(contact)
                return .none
                
            case let .deleteButtonTapped(id: id):
                state.destination = .alertState(AlertState {
                    TextState("Are you sure?")
                } actions: {
                    ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                        TextState("Delete")
                    }
                })
                return .none
                
            case let .destination(.presented(.alertAction(.confirmDeletion(id: id)))):
                state.contacts.remove(id: id)
                return .none
                
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
}

extension ContactsFeature {
    @Reducer
    struct Destination {
        enum State: Equatable {
            case addContact(AddContactFeature.State)
            case alertState(AlertState<ContactsFeature.Action.Alert>)
        }
        
        enum Action {
            case addContact(AddContactFeature.Action)
            case alertAction(ContactsFeature.Action.Alert)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.addContact, action: \.addContact) {
                AddContactFeature()
            }
        }
    }
}


