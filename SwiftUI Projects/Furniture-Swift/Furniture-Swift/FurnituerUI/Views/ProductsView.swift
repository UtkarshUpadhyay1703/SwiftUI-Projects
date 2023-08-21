//
//  ProductsView.swift
//  Furniture-Swift
//
//  Created by admin on 8/18/23.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: column, spacing: 20){
                    ForEach(productList, id: \.id){ product in
                        ProductCartView(product: product)
                    }
                }
                .padding()
            }
//            .navigationTitle(Text("All Furniture"))
            .navigationBarHidden(true)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(CartManager())
    }
}
