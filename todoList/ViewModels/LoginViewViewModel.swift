//
//  LoginViewViewModel.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModal: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    
    func login(){
        guard validate() else {
            return
        }
        
        // Try to log user in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".com") else {
            errorMessage = "Please make sure the email you entered is valid"
            return false
        }
        
        return true
    }
}
