//
//  Product.swift
//  Furniture-Swift
//
//  Created by admin on 8/16/23.
//

import Foundation
struct Product : Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
}

var productList = [
    Product(
        name: "Leather Couch",
        image: "fn1",
        description: "",
        supplier: "Amazon",
        price: 350
    ),
    Product(
        name: "Nice Couch",
        image: "fn2",
        description: "",
        supplier: "FlipKart",
        price: 350
    ),
    Product(
        name: "Gray Couch",
        image: "fn3",
        description: "",
        supplier: "Tata Nuo",
        price: 350
    ),
    Product(
        name: "Beautiful Couch",
        image: "fn4",
        description: "",
        supplier: "Paytm",
        price: 350
    ),
    Product(
        name: "Outdoor Couch",
        image: "fn5",
        description: "",
        supplier: "Dmart",
        price: 350
    ),
    Product(
        name: "Green Couch",
        image: "fn1",
        description: "",
        supplier: "Walmart",
        price: 350
    ),
]
