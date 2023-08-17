//
//  ContentView.swift
//  MagnificationGesture Use
//
//  Created by admin on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: 150, height: 50)
            .background(.red).cornerRadius(10)
            .scaleEffect( 1 + currentAmount)
            .gesture(
            MagnificationGesture()
                .onChanged { value in
                    currentAmount = value - 1
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
