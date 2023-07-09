//
//  MainViewViewModel.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = "36Ai82iYUeZ93TrKRpdNoruW8Ft1"
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn:Bool {
        return Auth.auth().currentUser != nil
    }
}
