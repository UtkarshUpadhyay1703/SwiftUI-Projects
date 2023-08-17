//
//  ContentView.swift
//  On Appear and Disappear Use
//
//  Created by admin on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = "Alpha"
    @State private var count: Int = 0
    var body: some View {
        NavigationView{
            ScrollView{
                Text(name)
                LazyVStack{
                    ForEach(0..<50){ _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            })
                    }
                }
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                        name = "Beta"
                    }
                })
            }
            .navigationTitle(Text("Feched data count = \(count)"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
