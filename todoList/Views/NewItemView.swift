//
//  TodoListItemsView.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemViewPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            
            Form {
                // Name
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                
                Button {
                    viewModel.save()
                    newItemViewPresented = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.pink)
                        Text("Save").foregroundColor(Color.white).bold()
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
        }
    }
}


struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemViewPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
