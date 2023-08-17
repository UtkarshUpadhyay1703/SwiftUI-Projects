//
//  ContentView.swift
//  Alert and Action Sheets
//
//  Created by admin on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresent = false
    
//    enum ActionSheetOptions {
//        case isMyPost
//        case isOtherPost
//    }
    
    var body: some View {
//        Button("Click to error"){
//            isPresent.toggle()
//        }
        
        Button{
            isPresent.toggle()
        }label: {
            Label("DELETE", systemImage: "trash.fill")
        }
        .buttonStyle(.bordered)
        .tint(.pink)
        
        
//        .alert(isPresented: $isPresent){
//            Alert(title: Text("This is an error"), message: Text("This is the message"))
//        }
        .confirmationDialog(
            Text("This is ConfirmationDialog")
                .font(.title)
                .foregroundColor(.red)
            , isPresented: $isPresent, titleVisibility: .visible){
            Button("Delete", role: .destructive){
                print("Item deleted")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
