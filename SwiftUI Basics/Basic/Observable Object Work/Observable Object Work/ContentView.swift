//
//  ContentView.swift
//  Observable Object Work
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            TextField("Enter name greater than 4", text: $name)
            Button(action: {debugPrint("name = \(self.name)")}, label:{ Text("Login")
            })
                .disabled(name.count <= 4)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
