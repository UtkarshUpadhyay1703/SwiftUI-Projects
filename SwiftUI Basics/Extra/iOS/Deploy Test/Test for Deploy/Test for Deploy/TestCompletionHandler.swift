//
//  TestCompletionHandler.swift
//  Test for Deploy
//
//  Created by admin on 3/6/24.
//

import SwiftUI

struct TestCompletionHandler: View {
	@State private var value:String = ""
    var body: some View {
        Text(value)
			.onAppear{
				getCompletionValue(val: 1) { resultValue in
					print("returned val = \(resultValue)")
					value = resultValue
				}
			}
			
    }
	
	func getCompletionValue(val: Int, completion: @escaping (String)->Void){
		if val == 1{
			print("called 1")
			completion("Value = 1")
		}
		if val > 0{
			print("called Positive")
			completion("Value = Positive")
		}
	}
}

struct TestCompletionHandler_Previews: PreviewProvider {
    static var previews: some View {
        TestCompletionHandler()
    }
}
