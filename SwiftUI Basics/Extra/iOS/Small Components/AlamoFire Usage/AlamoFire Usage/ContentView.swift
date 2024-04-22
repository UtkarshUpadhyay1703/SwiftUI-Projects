//
//  ContentView.swift
//  AlamoFire Usage
//
//  Created by admin on 8/31/23.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    private func fetchData() {
        
        AF.request("https://jsonplaceholder.typicode.com/todos").responseJSON { response in
//            print("Response = \(response.request)")
            print("Response= \(response.result)")
//            print("Response = \(response.response)")
        }
    }
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
            .onAppear {
                fetchData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
