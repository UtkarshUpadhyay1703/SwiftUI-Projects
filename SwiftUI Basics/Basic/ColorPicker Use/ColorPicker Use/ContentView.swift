//
//  ContentView.swift
//  ColorPicker Use
//
//  Created by admin on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var backColor: Color = .green
    var body: some View {
        ZStack{
            backColor
                .ignoresSafeArea(.all)
            ColorPicker("Select Your Own Background", selection: $backColor , supportsOpacity: false)
                .padding()
                .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
