//
//  TodoItem.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
}
