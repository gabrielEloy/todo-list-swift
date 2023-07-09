//
//  TodoListView.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct TodoItemView: View {
    @StateObject var viewModel = TodoItemViewViewModel()
    let item: TodoItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}


struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(item: .init(
            id: "123",
            title: "test title",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
