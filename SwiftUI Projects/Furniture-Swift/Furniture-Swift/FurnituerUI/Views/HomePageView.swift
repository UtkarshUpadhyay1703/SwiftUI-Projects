//
//  HomePageView.swift
//  Furniture-Swift
//
//  Created by admin on 8/17/23.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    AppBar()
                    
                    SearchView()
                    
                    ImageSliderView()
                    
                    HStack{
                        Text("New Rivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("kPrimary"))
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){ product in
                                NavigationLink{
//                                    Text(product.name)
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCartView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(.stack)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomePageView()
                .environmentObject(CartManager())
            .previewInterfaceOrientation(.portrait)
        }
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        //        NavigationView {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                Text("Pune, India")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink(destination: CartView()
                                .environmentObject(cartManager)
                ){
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
            Text("Find the most Luxurious")
                .font(.largeTitle.bold())
            + Text(" Furniture")
                .font(.largeTitle.bold())
                .foregroundColor(Color("kPrimary"))
        }
        //        }
        .padding()
        .environmentObject(CartManager())
    }
}
