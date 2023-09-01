//
//  ContentView.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

import SwiftUI
import Alamofire
import Nuke

struct ContentView: View {
    @ObservedObject private var viewModel:ViewModel = ViewModel()
        @State private var image:UIImage?
    
    var body: some View {
        ScrollView{
            LazyVStack{
                Text("Model Data")
                    .foregroundColor(.red)
                    .font(.title.bold())
                    .underline()
                ForEach( viewModel.data, id: \.id ){ data in
                    HStack{
                        URLImage(url: URL(string: data.thumbnailURL))
                    Text("Title: \n \(data.title)")
                        .font(.title2.bold())
                        .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
