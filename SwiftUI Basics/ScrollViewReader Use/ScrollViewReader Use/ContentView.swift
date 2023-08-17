//
//  ContentView.swift
//  ScrollViewReader Use
//
//  Created by admin on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textFieldValue = ""
    @State private var scrollToIndex: Int = 0
    var body: some View {
        VStack {
            TextField("Enter any number only upto 50", text: $textFieldValue)
                .font(.title2)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Click here to goto index = 40"){
                withAnimation(.spring()){
                    if let index = Int(textFieldValue){
                        
                    }
                    proxy.scrollTo(40, anchor: .bottom)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    
                    ForEach(1..<50){ index in
                        Text("Item number = \(index)")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .border(.brown, width: 3)
                            .shadow(color: .gray, radius: 15, x: 5, y: 5)
                            .padding()
                            .id(index)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
