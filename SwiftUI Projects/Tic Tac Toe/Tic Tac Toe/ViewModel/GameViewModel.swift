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
#if !os(watchOS)
    @Published var alertItem: AlertItem?
#else
    @ObservedObject var notificationViewModel = NotificationViewModel()
#endif
    var singlesMode: Mode?
    
    let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func processMultiPlayer(for position: Int ,firstPlayer: Bool) {
        if isSquareOccupied(forIndex: position) { return }
        moves[position] = firstPlayer ? Move(player: .human, boardIndex: position) : Move(player: .computer, boardIndex: position)
        
        //Check Win condition
        if checkWinCondition(for: firstPlayer ? .human : .computer) {
            //Alert Display on Watch OS
            print("Alert on WatchOS \(firstPlayer) Won !!!!!")
#if !os(watchOS)
            alertItem = firstPlayer ? AlertContext.firstPersonWin : AlertContext.secondPersonWin
#else
            //            firstPlayer ? AlertContext.firstPersonWin : AlertContext.secondPersonWin
            firstPlayer ? notificationViewModel.sendLocalNotification(title: "Person 1 Won !!!!!", body: "Person 1 is so Smart") : notificationViewModel.sendLocalNotification(title: "Person 2 Won !!!!!", body: "Person 2 is so Smart")
            watchAlertMain()
#endif
            return
        }
        
        // Check Draw Condition
        if checkForDraw(){
            //Alert Display on Watch OS
            print("Alert on WatchOS Draw !!!!!!")
            
#if !os(watchOS)
            alertItem = AlertContext.draw
#else
                notificationViewModel.sendLocalNotification(title: "Draw !!!!!", body: "What a battel of wits we have here....")
                watchAlertMain()
#endif
            return
        }
    }
    
    func processPlayerMove(for position: Int){
        //Human Move Processing
        if isSquareOccupied(forIndex: position) { return }
        moves[position] = Move(player: .human, boardIndex: position)
        
        //Check condition for win and for draw
        if checkWinCondition(for: .human) {
            //Alert Display on Watch OS
            print("Alert on WatchOS Human WON")
#if !os(watchOS)
            alertItem = AlertContext.humanWin
#else
            //            AlertContext.humanWin
            notificationViewModel.sendLocalNotification(title: "You Win !!!!", body: "You are so smart you beat your own AI")
            watchAlertMain()
#endif
            return
        }
        if checkForDraw(){
            //Alert Display on Watch OS
            print("Alert on WatchOS Draw")
#if !os(watchOS)
            alertItem = AlertContext.draw
#else
            //            AlertContext.draw
            notificationViewModel.sendLocalNotification(title: "Draw !!!!!", body: "What a battel of wits we have here....")
            watchAlertMain()
#endif
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
                //Alert Display on Watch OS
                print("Alert on WatchOS Computer WON")
#if !os(watchOS)
                alertItem = AlertContext.computerWin
#else
                //                AlertContext.computerWin
                notificationViewModel.sendLocalNotification(title: "You Lost !!!!", body: "You created a super AI")
                watchAlertMain()
#endif
                return
            }
            if checkForDraw(){
                //Alert Display on Watch OS
                print("Alert on WatchOS Draw")
#if !os(watchOS)
                alertItem = AlertContext.draw
#else
                //                AlertContext.draw
                notificationViewModel.sendLocalNotification(title: "Draw !!!!!", body: "What a battel of wits we have here....")
                watchAlertMain()
#endif
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
    
    func watchAlertMain(){
    isGameBoadDisable = true
    print("isGameBoadDisable = \(isGameBoadDisable)")
    //The behavior you described suggests that the code before the DispatchQueue is executed almost instantaneously, and the print statement doesn't have enough time to be displayed in the console.
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
        print("isGameBoadDisable = \(self.isGameBoadDisable)")
        self.resetGame()
        self.isGameBoadDisable = false
    })
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
