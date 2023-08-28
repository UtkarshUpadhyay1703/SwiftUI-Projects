//
//  ContentView.swift
//  TabView Use
//
//  Created by admin on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @Environment(\.colorScheme) var colorScheme
    let icons: [String] = [
    "person.fill", "house.fill", "heart.fill", "globe"
    ]
    var body: some View {
//        TabView{
//            Text("Hii")
//                .font(.largeTitle.bold())
////                .foregroundColor(Color("customColor"))
//                .foregroundColor(colorScheme == .light ? .green : .pink)
//
//            ForEach(icons, id: \.self){ icon in
//                Image(systemName: icon)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//            }
//            .background(
//                RadialGradient(colors: [Color.green, Color.blue, Color.orange], center: .center, startRadius: 5, endRadius: 200)
//            )
//        }
//        .frame(height: 330)
//        .tabViewStyle(PageTabViewStyle())
//        .background(.purple)
        
        
        TabView(selection: $selectedTab){
            HomeView(selectedTab: $selectedTab)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
                .badge(5)

            Text("Browser")
                .tabItem{
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
                .badge(5)

            Text("Profile")
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
                .badge("New")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct HomeView: View {
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack{
                Text("Home Page")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to Profile")
                        .font(.title.bold())
                        .foregroundColor(.green)
                        .frame(maxWidth: 200)
                        .cornerRadius(15)
                        .border(.green)
                        .background(.blue)
                })
            }
        }
    }
}
