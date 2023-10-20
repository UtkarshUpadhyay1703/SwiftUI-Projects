//
//  ContentView.swift
//  Shared
//
//  Created by admin on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .buttonStyle(.borderless)
            .textFieldStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
