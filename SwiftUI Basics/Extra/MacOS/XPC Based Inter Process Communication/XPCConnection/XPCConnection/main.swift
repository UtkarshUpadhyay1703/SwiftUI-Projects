//
//  main.swift
//  XPCConnection
//
//  Created by admin on 4/26/24.
//

import Foundation

print("Hello, World!")

class XPCService: NSObject, XPCServiceProtocol {
	func sayHello(_ name: String, withReply reply: @escaping (String) -> Void) {
		let response = "Hello, \(name)! This is from XPCService."
		reply(response)
	}
}

@objc protocol XPCServiceProtocol {
	func sayHello(_ name: String, withReply reply: @escaping (String) -> Void)
}

let listener = NSXPCListener.service()
let service = XPCService()
listener.delegate = service as? any NSXPCListenerDelegate
listener.resume()
RunLoop.current.run()
