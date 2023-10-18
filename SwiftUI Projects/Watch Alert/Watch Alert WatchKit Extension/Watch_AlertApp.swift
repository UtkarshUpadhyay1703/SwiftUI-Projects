//
//  Watch_AlertApp.swift
//  Watch Alert WatchKit Extension
//
//  Created by admin on 10/16/23.
//

import SwiftUI

@main
struct Watch_AlertApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
