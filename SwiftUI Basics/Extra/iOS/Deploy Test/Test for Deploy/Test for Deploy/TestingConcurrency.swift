//
//  TestingConcurrency.swift
//  Test for Deploy
//
//  Created by admin on 2/1/24.
//

import SwiftUI

class TestCon: ObservableObject{
	@Published var textChange = "0"
	
	func fetch1() async {
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.textChange = "1"
		}
	}
	//		await MainActor.run(body: {
	//			textChange = str
	//		})
	
//	@MainActor func fetch2() async {
	func fetch2() async {
		try? await Task.sleep(nanoseconds: 2_000_000_000)
		var str: String = ""
		await MainActor.run {
//			str =  "2"
//			textChange = str + "\(Thread.current)"
		}
	}
	
	func fetch3() async {
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.textChange = "3"
		}
	}
}


struct TestingConcurrency: View {
	@StateObject private var testVM = TestCon()
	
    var body: some View {
		VStack{
			Text(testVM.textChange)
		}
		.onAppear {
			Task{
//				await testVM.fetch1()
				await testVM.fetch2()
//				await testVM.fetch3()
			}
		}
    }
}

struct TestingConcurrency_Previews: PreviewProvider {
    static var previews: some View {
        TestingConcurrency()
    }
}
