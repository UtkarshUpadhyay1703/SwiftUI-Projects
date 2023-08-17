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
        ZStack(alignment: .top){
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack(alignment: .leading){
                    AppBar()
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            HStack{
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                Text("Pune, India")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink(destination: Text("")){
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
    }
}
