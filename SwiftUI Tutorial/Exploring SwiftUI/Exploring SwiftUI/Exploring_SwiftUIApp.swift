//
//  Exploring_SwiftUIApp.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/12/23.
//

import SwiftUI

@main
struct Exploring_SwiftUIApp: App {
    
    @StateObject private var modalData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modalData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
