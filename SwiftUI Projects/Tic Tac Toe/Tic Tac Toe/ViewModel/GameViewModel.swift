//
//  GameViewModel.swift
//  Tic Tac Toe
//
//  Created by admin on 10/11/23.
//

import SwiftUI

class GameViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoadDisable = false
    @Published var alertItem: AlertItem?
    var singlesMode: Mode?
    
    let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func processMultiPlayer(for position: Int ,firstPlayer: Bool) {
        if isSquareOccupied(forIndex: position) { return }
        moves[position] = firstPlayer ? Move(player: .human, boardIndex: position) : Move(player: .computer, boardIndex: position)
        
        //Check Win condition
        if checkWinCondition(for: firstPlayer ? .human : .computer) {
            alertItem = firstPlayer ? AlertContext.firstPersonWin : AlertContext.secondPersonWin
            return
        }
        
        // Check Draw Condition
        if checkForDraw(){
            alertItem = AlertContext.draw
            return
        }
    }
    
    func processPlayerMove(for position: Int){
        //Human Move Processing
        if isSquareOccupied(forIndex: position) { return }
        moves[position] = Move(player: .human, boardIndex: position)
        
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
        
        //Computer Move Processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition: Int = {
                switch singlesMode {
                case .veryEasy:
                    return determineComputerVeryEasyMovePosition()
                case .easy:
                    return determineComputerEasyMovePosition()
                case .basic:
                    return determineComputerBasicMovePosition()
                case .medium:
                    return determineComputerMediumMovePosition()
                case .none:
                    return determineComputerMediumMovePosition()
                }
            }()
            
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
    
    //All Functions
    func isSquareOccupied(forIndex index: Int) -> Bool{
        return moves.contains { $0?.boardIndex == index }
    }
    
    private var computerWinMove: Int {
        let computerMoves = moves.compactMap { $0 }.filter{ $0.player == .computer }
        let computerPositions = Set(computerMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(computerPositions)
            
            if winPositions.count == 1{
                let isAvaiable = !isSquareOccupied(forIndex: winPositions.first!)
                if isAvaiable { return winPositions.first! }
            }
        }
        return -1
    }
    
    private var computerBlockMove: Int {
        let humanMoves = moves.compactMap { $0 }.filter{ $0.player == .human }
        let humenPositions = Set(humanMoves.map{ $0.boardIndex })
        
        for pattern in winPatterns {
            let winPositions = pattern.subtracting(humenPositions)
            
            if winPositions.count == 1{
                let isAvaiable = !isSquareOccupied(forIndex: winPositions.first!)
                if isAvaiable { return winPositions.first! }
            }
        }
        return -1
    }
    
    private var computerCenterMove: Int {
        let centerSquare = 4
        if !isSquareOccupied(forIndex: centerSquare) { return centerSquare } else { return -1 }
    }
    
    private var computerRandomMove: Int {
        var movePosition = Int.random(in: 0..<9)
        while isSquareOccupied(forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func determineComputerVeryEasyMovePosition() -> Int {
        return computerRandomMove
    }
    
    func determineComputerEasyMovePosition() -> Int {
        //If AI can win then Win
        if computerWinMove > -1 {
            return computerWinMove
        }
        
        //If AI can't take middle square then take the random available square
        return computerRandomMove
    }
    
    func determineComputerBasicMovePosition() -> Int {
        //If AI can win then Win
        if computerWinMove > -1 {
            return computerWinMove
        }
        
        //If AI can't win then Block
        if computerBlockMove > -1 {
            return computerBlockMove
        }
        
        //If AI can't take middle square then take the random available square
        return computerRandomMove
    }
    
    func determineComputerMediumMovePosition() -> Int {
        //If AI can win then Win
        if computerWinMove > -1 {
            return computerWinMove
        }
        
        //If AI can't win then Block
        if computerBlockMove > -1 {
            return computerBlockMove
        }
        
        //If AI can't block then take the middle square
        if computerCenterMove > -1 {
            return computerCenterMove
        }
        
        //If AI can't take middle square then take the random available square
        return computerRandomMove
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

enum Mode: String, CaseIterable {
    case veryEasy, easy, basic, medium
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}
