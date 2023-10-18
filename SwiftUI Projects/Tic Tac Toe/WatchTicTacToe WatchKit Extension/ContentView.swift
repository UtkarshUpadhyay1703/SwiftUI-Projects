//
//  ContentView.swift
//  WatchTicTacToe WatchKit Extension
//
//  Created by admin on 10/16/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationView{
            LandingPage()
        }
        .ignoresSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
