//
//  ContentView.swift
//  Environment Object
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var user: Person = Person()
    @ObservedObject private var account: Account = Account()
    
    var body: some View {
        
        NavigationView{
        VStack{
            Text("Your name = \(user.name)")
            .padding()
            TextField("User name", text: $user.name)
            NavigationLink("Way to Second View ", destination: SecondView())
        }
        }.environmentObject(user)
            .environmentObject(account)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
