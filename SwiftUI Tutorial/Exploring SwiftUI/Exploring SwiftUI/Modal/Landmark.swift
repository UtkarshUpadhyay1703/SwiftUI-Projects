//
//  Landmark.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/13/23.
//

import SwiftUI
import Foundation
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    var id:Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, Codable, CaseIterable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    //Add an imageName property to read the name of the image from the data, and a computed image property that loads an image from the asset catalog.
    private var imageName: String//You make the property private because users of the Landmarks structure care only about the image itself.
    var image: Image{
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    
//    Add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure.
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
