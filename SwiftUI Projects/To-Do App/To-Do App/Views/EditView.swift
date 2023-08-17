//
//  EditView.swift
//  To-Do App
//
//  Created by admin on 8/11/23.
//
import SwiftUI

struct EditView: View {
    @Binding var toDoEdit: String
    var body: some View {
        VStack{
                TextEditor(text: $toDoEdit)
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

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(toDoEdit: .constant("Turn off the lights when not in use"))
            .preferredColorScheme(.light)
    }
}

