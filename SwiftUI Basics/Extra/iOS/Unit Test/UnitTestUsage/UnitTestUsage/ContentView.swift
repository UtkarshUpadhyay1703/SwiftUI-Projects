//
//  ContentView.swift
//  UnitTestUsage
//
//  Created by admin on 11/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world! \(Calculation().Add(num1: 10, num2: 20))")
            .padding()
    }
}

struct Calculation {
    func Add(num1: Double, num2: Double) -> Double {
        return num1 + num2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
