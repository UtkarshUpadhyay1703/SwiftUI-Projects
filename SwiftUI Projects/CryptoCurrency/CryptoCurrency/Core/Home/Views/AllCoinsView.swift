//
//  AllCoinsView.swift
//  CryptoCurrency
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    //We have not initialized the because we have initialized it once don't need to re-initialize.
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
            
            HStack{
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
