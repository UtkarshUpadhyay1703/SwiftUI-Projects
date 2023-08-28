//
//  ContentView.swift
//  Binding property Use
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .font(.title)
                .foregroundColor(isOn ? .yellow : .pink)
            ChildToggle(isOn: $isOn)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
