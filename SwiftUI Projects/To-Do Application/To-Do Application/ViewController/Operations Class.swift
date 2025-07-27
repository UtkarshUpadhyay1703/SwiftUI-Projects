//
//  Operations Class.swift
//  To-Do Application
//
//  Created by Utkarsh Upadhyay on 27/07/25.
//

import Foundation

class HandelOperations: ObservableObject {
    @Published var toDoList: [String] = [] {
     didSet {
         saveToDoList()
        }
    }
    
    init() {
        self.toDoList = UserDefaults.standard.stringArray(forKey: "toDoList") ?? []
    }
    
    func saveToDoList() {
        UserDefaults.standard.set(toDoList, forKey: "toDoList")
    }
}
