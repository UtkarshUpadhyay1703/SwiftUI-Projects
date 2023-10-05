//
//  DepartmentEmployeeApp.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//

import SwiftUI

@main
struct DepartmentEmployeeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
