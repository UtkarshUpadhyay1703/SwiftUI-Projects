//
//  Person.swift
//  Environment Object
//
//  Created by admin on 7/17/23.
//

import Foundation

class Person: ObservableObject{
    @Published var name = ""
}

class Account: ObservableObject{
    @Published var balance = 0.00
}
