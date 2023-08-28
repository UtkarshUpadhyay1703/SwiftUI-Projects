//
//  Person.swift
//  Publisher and ObservedObject
//
//  Created by admin on 7/17/23.
//

import Foundation

class Person: ObservableObject{
    @Published var name: String = String()
}
