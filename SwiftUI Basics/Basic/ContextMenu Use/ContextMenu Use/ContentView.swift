//
//  ContentView.swift
//  ContextMenu Use
//
//  Created by admin on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor: Color = .red
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
            Text("Hello, world!")
                .padding()
                .font(.headline)
            Text("Do check Context Menu")
        }
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .green
            }, label: {
                Label("Background = Green", systemImage: "cloud.heavyrain.fill")
            })
            
            Button(action: {
                backgroundColor = .blue
            }, label: {
                Label("Background = Blue", systemImage: "cloud.sun.rain.fill")
            })
            
            Button(action: {
                backgroundColor = .orange
            }, label: {
                Label("Background = Orange", systemImage: "multiply.circle.fill")
            })
        })
        .padding()
        .foregroundColor(.white)
        .background(backgroundColor.cornerRadius(15))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
