//
//  Book_LibraryApp.swift
//  Book Library
//
//  Created by admin on 10/6/23.
//

import SwiftUI

@main
struct Book_LibraryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
