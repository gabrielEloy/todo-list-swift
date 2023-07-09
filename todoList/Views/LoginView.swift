//
//  Login.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModal()
    
    var body: some View {
        //Header
        NavigationView(){
            VStack{
                HeaderView(title: "To do list", subtitle: "Get things Done",angle: 15, background: Color.pink)
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    
                    
                    
                    Button {
                        viewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                            Text("Log In").foregroundColor(Color.white).bold()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                }
                
                
                VStack{
                    Text("New Around Here ?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom, 50)
                
                Spacer()
                    
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
