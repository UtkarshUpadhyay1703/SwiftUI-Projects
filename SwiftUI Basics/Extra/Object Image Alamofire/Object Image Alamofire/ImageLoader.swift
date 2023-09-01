//
//  ImageLoader.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

import Foundation
import UIKit

enum NetworkError: Error {
case badRequest
case unsupportedImage
case badUrl
}

@MainActor
class ImageLoader: ObservableObject {
    @Published var uiImage: UIImage?
    private static let cache = NSCache<NSString,UIImage> ()
    
    func fetchImage(_ url: URL? ) async throws {
        guard let url = url else {
            throw NetworkError.badUrl
        }
        
        let request = URLRequest(url: url)
        //Check the image is present in the chache or not
        
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString){
            uiImage = cachedImage
        } else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.badRequest
            }
            
            guard let image = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }
            
            //Store  into the cache
            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            
            uiImage = image
        }
    }
}
