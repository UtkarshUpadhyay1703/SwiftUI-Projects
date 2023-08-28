//
//  ContentView.swift
//  Sheet Use
//
//  Created by admin on 7/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSet = false
    
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            Button(action: {
                isSet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .padding(20)
                    .font(.headline)
                    .background(Color.white.cornerRadius(10))
            })
//                .fullScreenCover(isPresented: $isSet, content: {
//                    SecondView()
//                })
                .sheet(isPresented: $isSet, content: {
                    SecondView()
                })
        }
    }
}

struct SecondView: View{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.purple
                .ignoresSafeArea()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding(20)
                    .font(.headline)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
