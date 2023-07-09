//
//  RegisterViewViewModel.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation


class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self]     result, error in guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate () -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".com") else {
            errorMessage = "Please make sure the email you entered is valid"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Your password must have at least 7 characters"
            return false
        }
        
        
        return true
    }
    
}
