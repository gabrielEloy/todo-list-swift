//
//  LoginViewViewModel.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoItemViewViewModel: ObservableObject {
    init() {}
    
    
    func toggleIsDone(item: TodoItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newItem.id).setData(newItem.asDictionary())
    }
}
