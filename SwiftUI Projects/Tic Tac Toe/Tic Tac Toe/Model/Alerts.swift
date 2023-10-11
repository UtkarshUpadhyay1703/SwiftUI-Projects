//
//  Alerts.swift
//  Tic Tac Toe
//
//  Created by admin on 10/10/23.
//

import SwiftUI
struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win !!!!"), message: Text("You are so smart you beat your own AI"), buttonTitle: Text("Hell Yeah"))
    
    static let computerWin = AlertItem(title: Text("You Lost !!!!"), message: Text("You created a super AI"), buttonTitle: Text("Rematch"))
    
    static let firstPersonWin = AlertItem(title: Text("Person 1 Won !!!!!"), message: Text("Person 1 is so Smart"), buttonTitle: Text("Courage To Rematch"))
    
    static let secondPersonWin = AlertItem(title: Text("Person 2 Won !!!!!"), message: Text("Person 2 is so Smart"), buttonTitle: Text("Courage To Rematch"))
    
    static let draw = AlertItem(title: Text("Draw !!!!!"), message: Text("What a battel of wits we have here...."), buttonTitle: Text("Try Again"))
}
