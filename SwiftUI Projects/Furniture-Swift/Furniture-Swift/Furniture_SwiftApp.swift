//
//  Furniture_SwiftApp.swift
//  Furniture-Swift
//
//  Created by admin on 8/16/23.
//

import SwiftUI

@main
struct Furniture_SwiftApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ProductView(product: productList[0])
        }
    }
}
