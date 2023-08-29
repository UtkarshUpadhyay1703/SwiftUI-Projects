//
//  TopMoversView.swift
//  CryptoCurrency
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
//            TopMoversItem
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16){
                    ForEach(viewModel.topMovingCoins){ coin in
                        TopMoversItem(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
