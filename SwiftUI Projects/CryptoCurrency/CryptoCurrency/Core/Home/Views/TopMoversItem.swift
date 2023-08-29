//
//  TopMoversItem.swift
//  CryptoCurrency
//
//  Created by admin on 8/28/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItem: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading){
            //Coin Image
//            Image(systemName: "bitcoinsign.circle.fill")
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            
            //Coin info
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //Coin Percentage Change
            Text("\(coin.priceChangePercentage24H.toPercentString())")
                .font(.title2)
                .foregroundColor( coin.priceChangePercentage24H > 0 ? .green : .red )
            
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4), lineWidth: 2)
        
        )
    }
}

//struct TopMoversItem_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItem()
//    }
//}
