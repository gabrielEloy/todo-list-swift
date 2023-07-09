//
//  Login.swift
//  todoList
//
//  Created by Gabriel Eloy on 28/06/23.
//

import SwiftUI


struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        //Header
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(self.background)
                    .rotationEffect(Angle(degrees: self.angle))
                VStack{
                    Text(title)
                        .font(Font.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(Font.system(size: 30))
                        .foregroundColor(Color.white)
                }.padding(.top, 30)
            }
            .offset(y: -150)
            .frame(width: UIScreen.main.bounds.width * 3,height: 350)
            
                
        }
        
        
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To do list", subtitle: "Get things Done",angle: 15, background: Color.pink)
    }
}
