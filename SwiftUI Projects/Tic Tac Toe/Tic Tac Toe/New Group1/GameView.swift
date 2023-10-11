//
//  GameView.swift
//  Tic Tac Toe
//
//  Created by admin on 10/10/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    var isSinglePlayerMatch: Bool
    @State private var isFirstPlayer: Bool = true
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5){
                    ForEach(0..<9){ index in
                        ZStack{
                            GameSquareView(proxy: geometry)
                            
                            PlayerIndicator(systemImageName: viewModel.moves[index]?.indicator ?? "")
                        }
                        .onTapGesture {
                            isSinglePlayerMatch ? viewModel.processPlayerMove(for: index) : viewModel.processMultiPlayer(for: index, firstPlayer: isFirstPlayer ? true : false)
                            if !isSinglePlayerMatch { isFirstPlayer.toggle() }
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoadDisable)
            .padding()
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: .default(viewModel.alertItem?.buttonTitle ?? Text(""), action: { viewModel.resetGame() }))
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isSinglePlayerMatch: false)
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.5)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
