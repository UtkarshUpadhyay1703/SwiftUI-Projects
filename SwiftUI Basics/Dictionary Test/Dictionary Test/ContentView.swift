//
//  ContentView.swift
//  Dictionary Test
//
//  Created by admin on 7/20/23.
//

import SwiftUI

class Person{
var name: String
var age: Int
var companyName: String
    init(name: String, age: Int, companyName: String) {
        self.name = name
        self.age = age
        self.companyName = companyName
    }
}

struct ContentView: View {
    var obj1 = Person(name: "one", age: 1, companyName: "ONE")
    var obj2 = Person(name: "two", age: 2, companyName: "TWO")
    var obj3 = Person(name: "one", age: 3, companyName: "THREE")
    var obj4 = Person(name: "four", age: 4, companyName: "FOUR")
    var obj5 = Person(name: "two", age: 5, companyName: "FIVE")
//    var arr:[Person] = [obj1,obj2,obj3,obj4,obj5]
    var arr: [Person]
    init() {
        arr = [obj1,obj2,obj3,obj4,obj5]
    }
    
    var dic: [String: [Person]]{
        Dictionary(
            grouping: arr,
            by: { $0.name})
    }
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
//        ForEach(dic.keys, id: \.self){key in
//            
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
