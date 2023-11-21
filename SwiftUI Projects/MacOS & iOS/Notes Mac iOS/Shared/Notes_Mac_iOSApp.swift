//
//  Notes_Mac_iOSApp.swift
//  Shared
//
//  Created by admin on 10/19/23.
//

import SwiftUI

@main
struct Notes_Mac_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            if let defaults = UserDefaults(suiteName: "group.com.faronics.Notes-Mac-iOS.MacWidged"){
            ContentView()
                .defaultAppStorage(defaults)
            }else {
                Text("Failed to load User Defaults Mack")
            }
            #else
            if let defaults = UserDefaults(suiteName: "group.com.faronics.Notes-Mac-iOS.IOSWidged"){
            ContentView()
                .defaultAppStorage(defaults)
            }else {
                Text("Failed to load User Defaults")
            }
            #endif
        }
        //Hiding title Bar
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        #endif
    }
}
