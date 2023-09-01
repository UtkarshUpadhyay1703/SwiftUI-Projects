//
//  CoreData_UsageApp.swift
//  CoreData Usage
//
//  Created by admin on 8/31/23.
//

import SwiftUI

@main
struct CoreData_UsageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
