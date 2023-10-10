//
//  URLImage.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

import SwiftUI

struct URLImage: View {
    let url: URL?
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            if let uiImage = imageLoader.uiImage {
                Image(uiImage: uiImage)
            }else{
                ProgressView("Loaging !!!!!!")
            }
        }
        .task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        do{
            try await imageLoader.fetchImage(url)
        } catch {
            print("Error = \(error)")
        }
    }
}
