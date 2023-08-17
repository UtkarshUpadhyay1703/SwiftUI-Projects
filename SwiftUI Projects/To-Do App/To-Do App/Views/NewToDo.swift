//
//  NewToDo.swift
//  To-Do App
//
//  Created by admin on 8/9/23.
//

import SwiftUI

struct NewToDo: View {
    @Binding var toDoString: String
    var body: some View {
        VStack{
                TextEditor(text: $toDoString)
                    .font(.headline)
                    .frame(width: 350, height: 600, alignment: .center)
                    .colorMultiply(Color("ColorBackground").opacity(0.8))
                    .foregroundColor(Color("ColorText"))
                    .padding(20)
    }
        .background(Image("OM2"))
        .ignoresSafeArea()
    }
}

struct NewToDo_Previews: PreviewProvider {
    static var previews: some View {
        NewToDo(toDoString: .constant("Turn off the lights when not in use"))
            .preferredColorScheme(.light)
    }
}
