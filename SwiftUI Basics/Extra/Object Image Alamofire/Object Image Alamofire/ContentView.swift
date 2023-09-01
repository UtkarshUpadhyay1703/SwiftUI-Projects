//
//  ContentView.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

import SwiftUI
import Alamofire
//import AlamofireImage
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
                        AsyncImage(url: URL(string: data.thumbnailURL))
                        
                        
                    Text("Title: \(data.title)")
                        .font(.title2.bold())
                        .foregroundColor(.green)
                    }
                    
//                    if let image = image {
//                        Image(uiImage: image)
//                    }else{
//                        Text("Loading !!!!!!!!")
//                            .onAppear{
////                                loadImage(url: data.thumbnailURL)
//                                self.image = Nuke.loadImage(with: data.url)
//                            }
//                    }
                    
                    
//                    Image(uiImage: Nuke.loadImage(with: data.url))
                    
                    
//                    Divider()
//                    Divider()
                    //                    if let image = image {
                    //                        //                        Image(uiImage: image)
                    //                        image
                    //                            .resizable()
                    //                            .scaledToFit()
                    //                    } else {
                    //                        Text("Loading !!!!!!!!")
                    //                            .onAppear{
                    //                                downloadImage(url: data.thumbnailURL)
                    //                            }
                    //                        //                    }
                    //                    }
                }
            }
        }
    }
    
    //    func downloadImage(url: String) {
    //        AF.download(url).responseData { response in
    //            switch response.result {
    //            case .success(let data):
    //                if let fetchedImage = UIImage(data: data){
    //                    DispatchQueue.main.async {
    //                        self.image = fetchedImage
    //                    }
    //                }
    //            case .failure(let error):
    //                print("Image download failed with error: \(error)")
    //            }
    //        }
    
    
    //        AF.request(url).responseImage { response in
    //            //                if response.result.value != nil {
    //            //                    let image1 = UIImage(data: response.data!, scale: 1.0)!
    //            //                    self.image = image1
    //            //                }
    //            switch response.result {
    //            case .success(let imageResponse):
    //                self.image = Image(uiImage: imageResponse)
    //                //                    print("\(imageResponse)")
    //            case .failure(let error):
    //                print("Image download failed with error: \(error)")
    //            }
    //        }
    //    }
    
    
//    func loadImage(url: String){
////        if let imageData = try? Data(contentsOf: url),
//        if let imageData = try? Data(contentsOf: URL(string: url)!),
//             let image = UIImage(data: imageData) {
//               self.image = image
//           } else {
//               self.image = nil
//           }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
