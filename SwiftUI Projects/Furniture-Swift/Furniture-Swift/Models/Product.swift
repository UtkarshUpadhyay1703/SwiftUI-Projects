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
    var width: String
    var height: String
    var diameter: String
}

var productList = [
    Product(
        name: "Leather Couch",
        image: "fn1",
        description: """
                Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
                The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "Amazon",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
    Product(
        name: "Nice Couch",
        image: "fn2",
        description: """
        Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
        The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "FlipKart",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
    Product(
        name: "Gray Couch",
        image: "fn3",
        description: """
                Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
                The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "Tata Nuo",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
    Product(
        name: "Beautiful Couch",
        image: "fn4",
        description: """
                Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
                The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "Paytm",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
    Product(
        name: "Outdoor Couch",
        image: "fn5",
        description: """
                Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
                The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "Dmart",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
    Product(
        name: "Green Couch",
        image: "fn1",
        description: """
                Furniture having intricate hand-painted details are individual unique pieces and may have slight distinctions and variance between the picture and actual product.
                The Primary material is the main material used to manufacture the product and in addition to the primary materials.
        """,
        supplier: "Walmart",
        price: 350,
        width: "200 cm",
        height: "135 cm",
        diameter: "105 cm"
    ),
]
