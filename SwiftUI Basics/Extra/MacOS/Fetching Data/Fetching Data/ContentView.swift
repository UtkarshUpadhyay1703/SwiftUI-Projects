//
//  ContentView.swift
//  Fetching Data
//
//  Created by admin on 10/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                //The Table view in SwiftUI was introduced in macOS 12 (Monterey). Therefore, the minimum macOS version requirement to use the Table view is macOS 12 or later. 
                // So we cant use Table here
                ForEach(viewModel.fakeData, id: \.self){ model in
                    HStack{
                        Text("UserId = \(model.userId ?? -1)")
                        Text("Id = \(model.id ?? -1)")
                        Text("Title = \(model.title ?? "")")
                        Text("Body = \(model.body ?? "")")
                    }
                    .padding()
                }
            }
            .navigationTitle("Fake Data")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
