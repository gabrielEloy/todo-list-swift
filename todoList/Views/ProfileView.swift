//
//  ProfileView.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseFirestoreSwift
import SwiftUI


struct ProfileView: View{
    @StateObject var viewModel = ProfileViewViewModel()
    var userId = ""
    
    init(userId: String){
        self.userId = userId
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 170, height: 170) // Set the desired width and height
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 50)
                    .padding(.bottom, 40)
                    .foregroundColor(Color.blue)
                
                
                
                
                if(viewModel.isLoading) {
                    Spacer()
                    Text("Loading...").font(Font.system(size: 32))
                    Spacer()
                } else {
                    HStack(spacing: 10) {
                        
                        Text("Name:").padding(.leading, 40).font(Font.system(size: 20, weight: .semibold))
                        Text(viewModel.user?.name ?? "").font(Font.system(size: 18, weight: .light))
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    HStack(spacing: 10) {
                        
                        Text("Email:").padding(.leading, 40).font(Font.system(size: 20, weight: .semibold))
                        Text(viewModel.user?.email ?? "").font(Font.system(size: 18, weight: .light))
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    HStack(spacing: 10) {
                        
                        Text("Member Since:").padding(.leading, 40).font(Font.system(size: 20, weight: .semibold))
                        Text(Date(timeIntervalSince1970: viewModel.user?.joined ?? Date().timeIntervalSince1970).formatted(date: .abbreviated, time: .omitted)).font(Font.system(size: 18, weight: .light))
                        Spacer()
                    }.padding(.bottom, 50)
                }
                
                
                
                Button {
                    viewModel.logout()
                } label: {
                    Text("Log out").font(Font.system(size: 28, weight: .light)).foregroundColor(Color.red)
                }
                
                Spacer()
            }.navigationTitle("Profile")
            
            
        }.onAppear() {
            viewModel.fetchUser(userId: userId)
        }
    }
}



struct ProfileView_Previes: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: "36Ai82iYUeZ93TrKRpdNoruW8Ft1")
    }
}
