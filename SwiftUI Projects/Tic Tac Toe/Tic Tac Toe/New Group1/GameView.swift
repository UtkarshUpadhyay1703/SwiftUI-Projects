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
    var selectedMode: Mode?
    @State private var isFirstPlayer: Bool = true
#if !os(watchOS)
    @State private var firstPersonImage: UIImage?
    @State private var secondPersonImage: UIImage?
    @StateObject private var photoViewModel = PhotoPickerViewModel()
    #endif
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
#if !os(watchOS)
    
                HStack{
                    Image(uiImage: firstPersonImage ?? UIImage())
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle() .stroke(.gray,lineWidth: 3))
                    Spacer()
                    
                    Text("V/S")

                    Spacer()
                    if isSinglePlayerMatch {
                        Image("computerImage")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle()
                                        .stroke(.gray,lineWidth: 3))
                    } else {
                        Image(uiImage: secondPersonImage ?? UIImage())
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle()
                                        .stroke(.gray,lineWidth: 3))
                    }
                }
#endif
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
#if !os(watchOS)
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: .default(viewModel.alertItem?.buttonTitle ?? Text(""), action: { viewModel.resetGame() }))
            }
            #endif
        }
        .onAppear {
#if !os(watchOS)
            firstPersonImage = photoViewModel.setProfileImage(isFirst: true)
            if !isSinglePlayerMatch{
                secondPersonImage = photoViewModel.setProfileImage(isFirst: false)
            } else{
                viewModel.singlesMode = selectedMode
            }
#else
            viewModel.singlesMode = selectedMode
            #endif
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isSinglePlayerMatch: true)
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
