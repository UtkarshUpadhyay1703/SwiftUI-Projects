//
//  ItemAndTagApp.swift
//  ItemAndTag
//
//  Created by admin on 10/6/23.
//

import SwiftUI

@main
struct ItemAndTagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
