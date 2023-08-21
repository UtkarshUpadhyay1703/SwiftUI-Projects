//
//  ProductDetailsView.swift
//  Furniture-Swift
//
//  Created by admin on 8/18/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        ScrollView{
            ZStack{
                Color.white
                
                VStack(alignment: .leading){
                    ZStack(alignment: .topTrailing){
                        Image(product.image)
                            .resizable()
                            .frame(height: 300)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }
                    VStack(alignment: .leading){
                        HStack{
                            Text(product.name)
                                .font(.title2.bold())
                            
                            Spacer()
                            
                            Text("₹\(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color.kSecondary)
                                .cornerRadius(12)
                        }
                        .padding(.vertical)
                        
                        HStack {
                            HStack(spacing: 10){
                                ForEach(0..<5){ index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.yellow)
                                }
                                Text("4.5")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical)
                            Spacer()
                            HStack{
                                Button(action: {
                                    cartManager.removeFromCart(product: product)
                                }, label: {
                                    Image(systemName: "minus.square")
                                })
                                Text("\(cartManager.products.count)")
                                Button(action: {
                                    cartManager.addToCart(product: product)
                                }, label: {
                                    Image(systemName: "plus.square.fill")
                                        .foregroundColor(.kPrimary)
                                })
                            }
                        }
                        
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text(product.description)
                        Spacer()
                        HStack(alignment: .top){
                            VStack(alignment: .leading){
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Text("Height: \(product.height)")
                                    .foregroundColor(.gray)
                                Text("Width: \(product.width)")
                                    .foregroundColor(.gray)
                                Text("Diameter: \(product.diameter)")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                HStack{
                                    ColorDotView(color: .blue)
                                    ColorDotView(color: .black)
                                    ColorDotView(color: .gray)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical)
                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 50)
                            .cornerRadius(15)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[3])
            .environmentObject(CartManager())
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View{
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}
