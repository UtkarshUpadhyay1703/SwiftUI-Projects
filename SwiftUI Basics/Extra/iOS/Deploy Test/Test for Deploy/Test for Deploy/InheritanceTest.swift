//
//  InheritanceTest.swift
//  Test for Deploy
//
//  Created by admin on 1/24/24.
//

import SwiftUI

struct InheritanceTest: View {
	@ObservedObject private var inherit = Inheritance()
	var body: some View {
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.onAppear {
				inherit.speak()
				let weekday = Weekday.saturday.weekday(for: 2)
				print(weekday ?? "") // Output: tuesday
				let person = Person()
				print(person[4,3])
			}
	}
}

class Person{
	var arr = ["ff","ss","tt"]
	var arr2 = [1,9,4,6,4]
	subscript(val:Int) -> Int{
		get {
			var count = 0
			for v in arr2{
				if(v==val){
					count+=1
				}
			}
			return count
		}
	}
	subscript(index1:Int,index2:Int) -> (String,Int){
		guard index1 >= 0, index1 < arr.count, index2 >= 0, index2 < arr2.count else {
				return ("LOL", -1) // Return nil if indices are out of bounds
			}
		return (arr[index1],arr2[index2])
	}
}

enum Weekday: Int {
	case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
	
	func weekday(for rawValue: Int) -> Weekday? {
		return Weekday(rawValue: rawValue)
	}
}


protocol InheritanceProtocol {
	func speak()
}

extension InheritanceProtocol {
	func speak() {
		debugPrint("Indians")
	}
}

class Inheritance: ObservableObject, InheritanceProtocol{
	func speak() {
		debugPrint("Indians are the Best")
	}
}

struct InheritanceTest_Previews: PreviewProvider {
	static var previews: some View {
		InheritanceTest()
	}
}
