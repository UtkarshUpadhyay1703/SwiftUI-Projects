//
//  CartManager.swift
//  Furniture-Swift
//
//  Created by admin on 8/17/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Int = 0
    // private(set) means: Can be modified from within the struct or class that declares it but cannot be modified from outside that context.
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product){
        products = products.filter{ $0.id != product.id }
        total -= product.price
    }
}
