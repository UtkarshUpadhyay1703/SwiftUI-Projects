//
//  Toast_UsageApp.swift
//  Toast Usage
//
//  Created by admin on 10/9/23.
//

import SwiftUI

@main
struct Toast_UsageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(type: .warning, title: "Warning", message: "Its an warning to surrender infront of us"){}
        }
    }
}
