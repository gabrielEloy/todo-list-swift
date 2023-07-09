//
//  ContentView.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            loggedView
            
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var loggedView: some View {
        TabView{
            TodoListView(userId: viewModel.currentUserId).tabItem {
                Label("home", systemImage: "house")
            }
            
            ProfileView(userId: viewModel.currentUserId).tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
