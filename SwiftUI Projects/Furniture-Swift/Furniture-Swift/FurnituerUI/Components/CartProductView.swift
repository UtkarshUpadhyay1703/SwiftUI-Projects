//
//  CartProductView.swift
//  Furniture-Swift
//
//  Created by admin on 8/17/23.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            
        }
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: productList[0])
            .environmentObject(CartManager())
    }
}
