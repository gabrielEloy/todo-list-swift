//
//  Login.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        //Header
        NavigationView(){
            VStack{
                HeaderView(title: "Register", subtitle: "Start getting things done!", angle: 345, background: Color.orange)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                Form {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Create Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    
                    
                    Button {
                        viewModel.register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green)
                            Text("Register").foregroundColor(Color.white).bold()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                }
                    
            }
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
