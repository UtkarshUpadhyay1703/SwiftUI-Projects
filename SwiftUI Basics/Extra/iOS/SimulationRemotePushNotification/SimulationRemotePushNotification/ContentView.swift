//
//  ContentView.swift
//  SimulationRemotePushNotification
//
//  Created by admin on 9/6/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert]) { _, _ in
                    
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
