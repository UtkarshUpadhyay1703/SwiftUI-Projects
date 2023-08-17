//
//  ContentView.swift
//  AppStorage Use
//
//  Created by admin on 8/2/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var userName: String?
    @AppStorage("name") private var userName: String?
    var body: some View {
        VStack(spacing: 20){
            Text(userName ?? "add a Name first")
            
            if let name = userName{
                Text(name)
            }
            Button("Save"){
                let name: String = "More"
                userName = name
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        .onAppear(perform: {
//            userName = UserDefaults.standard.string(forKey: "name")
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
