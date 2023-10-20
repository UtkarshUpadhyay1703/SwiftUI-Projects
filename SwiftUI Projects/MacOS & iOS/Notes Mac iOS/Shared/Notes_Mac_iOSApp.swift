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
            ContentView()
        }
        //Hiding title Bar
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        #endif
    }
}
