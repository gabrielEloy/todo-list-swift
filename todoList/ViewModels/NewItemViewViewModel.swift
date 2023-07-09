//
//  NewItemViewViewModel.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation


class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var dueDate = Date()
    
    
    
    
    init() {}
    
    
    func save(){
        guard canSave() else {
            showAlert = true;
            return
        }
        
        //Get Current user Id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newItemId = UUID().uuidString
        let newItem = TodoItem(
            id: newItemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users").document(uId).collection("todos").document(newItemId).setData(newItem.asDictionary())
    }
    
    func canSave() -> Bool {
        errorMessage = ""
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Add a title to your todo"
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Choose a due date that is today or later."
            return false
        }
        
        return true
    }

    
}
