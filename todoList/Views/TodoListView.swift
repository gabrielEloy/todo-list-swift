//
//  TodoListItemsView.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import FirebaseFirestoreSwift
import SwiftUI


struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    @FirestoreQuery var items: [TodoItem]
    
    init(userId: String) {

        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) {
                    item in TodoItemView(item: item).swipeActions{
                        Button {
                            viewModel.deleteItem(id: item.id)
                        } label: {
                            
                            HStack{
                                Image(systemName: "trash.fill")
                            }.foregroundColor(Color.red)
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Todo")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $viewModel.showingNewItemView){
            NewItemView(newItemViewPresented: $viewModel.showingNewItemView)
        }
    }
}


struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "36Ai82iYUeZ93TrKRpdNoruW8Ft1")
    }
}
