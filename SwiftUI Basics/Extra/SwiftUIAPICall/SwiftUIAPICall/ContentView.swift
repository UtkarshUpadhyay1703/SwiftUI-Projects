//
//  ContentView.swift
//  SwiftUIAPICall
//
//  Created by admin on 8/25/23.
//
/*
 Here we will fetch all json data i.e.
 name and image
 where name is in string and image is also having an url
 that's why we fetched 2 times data 1 for full UserModel and second for image.
 */

import SwiftUI

struct URLImage:View {
    let urlString:String
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(.gray)
        } else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(.gray)
                .onAppear{
                    fetchImageData()
                }
        }
    }
    private func fetchImageData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){ course in
                    HStack{
                        URLImage(urlString: course.image)
                            .frame(width: 130, height: 70)
                            .background(.gray)
                        Text(course.name)
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
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
