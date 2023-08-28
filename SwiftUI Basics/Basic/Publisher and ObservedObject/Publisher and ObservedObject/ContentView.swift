//
//  ContentView.swift
//  Publisher and ObservedObject
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var user: Person = Person()
    
    var body: some View {
        VStack{
            Text("Your name is = \(user.name)")
        TextField("name", text: $user.name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
