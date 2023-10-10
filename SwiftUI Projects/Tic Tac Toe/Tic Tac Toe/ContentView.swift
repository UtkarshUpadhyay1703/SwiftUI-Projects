//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by admin on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameBoadDisable = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(0..<9){ index in
                        ZStack{
                            Circle()
                                .foregroundColor(.red).opacity(0.5)
                                .frame(width: geometry.size.width/3 - 15, height: geometry.size.width/3 - 15)
                            
                            Image(systemName: moves[index]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            if isSquareOccupied(forIndex: index) { return }
                            moves[index] = Move(player: .human, boardIndex: index)
                            
                            //Check condition for win and for draw
                            if checkWinCondition(for: .human) {
                                alertItem = AlertContext.humanWin
                                return
                            }
                            if checkForDraw(){
                                alertItem = AlertContext.draw
                                return
                            }
                            isGameBoadDisable = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let computerPosition = determineComputerMovePosition()
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isGameBoadDisable = false
                                if checkWinCondition(for: .computer){
                                    alertItem = AlertContext.computerWin
                                    return
                                }
                                if checkForDraw(){
                                    alertItem = AlertContext.draw
                                    return
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .disabled(isGameBoadDisable)
            .padding()
            .alert(item: $alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: .default(alertItem?.buttonTitle ?? Text(""), action: { resetGame() }))
            }
        }
    }
    
    func isSquareOccupied(forIndex index: Int) -> Bool{
        return moves.contains { $0?.boardIndex == index }
    }
    
    func determineComputerMovePosition() -> Int {
        //If AI can win then Win
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        let computerMoves = moves.compactMap { $0 }.filter{ $0.player == .computer }
        let computerPositions = Set(computerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPositions)
            
            if winPositions.count == 1{
                let isAvaiable = !isSquareOccupied(forIndex: winPositions.first!)
                if isAvaiable { return winPositions.first! }
            }
        }
        
        //If AI can't win then Block
        let humanMoves = moves.compactMap { $0 }.filter{ $0.player == .human }
        let humenPositions = Set(humanMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humenPositions)
            
            if winPositions.count == 1{
                let isAvaiable = !isSquareOccupied(forIndex: winPositions.first!)
                if isAvaiable { return winPositions.first! }
            }
        }
        
        //If AI can't block then take the middle square
        let centerSquare = 4
        if isSquareOccupied(forIndex: centerSquare) { return centerSquare }
        
        //If AI can't take middle square then take the random available square
        
        
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        let playerMoves = moves.compactMap { $0 }.filter{ $0.player == player }
        let playerPositions = Set(playerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions){ return true }
        return false
    }
    
    func checkForDraw() -> Bool {
        return moves.compactMap{ $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
