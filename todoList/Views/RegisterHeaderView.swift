//
//  Login.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct RegisterHeaderView: View {
    var body: some View {
        //Header
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.orange)
                    .rotationEffect(Angle(degrees: 345))
                VStack{
                    Text("Register")
                        .font(Font.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text("Start Organizing your life")
                        .font(Font.system(size: 30))
                        .foregroundColor(Color.white)
                }.padding(.top, 30)
            }
            .offset(y: -100)
            .frame(width: UIScreen.main.bounds.width * 3,height: 300)
            
                
        }
        
        
    }
}


struct RegisterHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterHeaderView()
    }
}
