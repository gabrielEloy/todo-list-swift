//
//  todoListApp.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseCore
import SwiftUI

@main
struct todoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
