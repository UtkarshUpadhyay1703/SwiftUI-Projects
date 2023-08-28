//
//  ContentView.swift
//  Localization Usage
//
//  Created by admin on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    var age = "23"
    var body: some View {
        VStack{
        Text("what_is_your_plan")
            Text("your age is \(age)")
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
