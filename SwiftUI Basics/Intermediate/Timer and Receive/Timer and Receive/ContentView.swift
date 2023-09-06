//
//  ContentView.swift
//  Timer and Receive
//
//  Created by admin on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State private var currentDate:Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.green, Color.blue, Color.orange], center: .center, startRadius: 100, endRadius: 200)
                .ignoresSafeArea()
        
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size: 50, weight: .semibold, design: .rounded))
        }
        .onReceive(timer) { value in
            currentDate = value
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
