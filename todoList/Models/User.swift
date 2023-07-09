//
//  User.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
