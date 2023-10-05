//
//  UIOneToOneApp.swift
//  UIOneToOne
//
//  Created by admin on 10/3/23.
//

import SwiftUI

@main
struct UIOneToOneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
