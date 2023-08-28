//
//  ContentView.swift
//  NavigationView vs NavigationLink
//
//  Created by admin on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink("This is the new world", destination: SecondView())
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .navigationTitle("Hii")
//            .navigationBarTitleDisplayMode(.automatic)
//            .navigationBarHidden(true)
        }
    }
}

struct SecondView: View{
    var body: some View{
        ZStack{
        Color.green.edgesIgnoringSafeArea(.all)
            navigationTitle("Green Screen !")
//                .navigationBarItems(leading: Image(systemName: "person.fill"), trailing: Image(systemName: "gear"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
