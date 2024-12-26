//
//  main.swift
//  XPCClient
//
//  Created by admin on 4/26/24.
//

import Foundation

print("Hello, World!")

let connection = NSXPCConnection(serviceName: "com.faronics.XPCServerService")
connection.remoteObjectInterface = NSXPCInterface(with: XPCServiceProtocol.self)
connection.resume()

let remoteObject = connection.remoteObjectProxyWithErrorHandler { error in
	print("Encountered an error:", error)
} as! XPCServiceProtocol

remoteObject.sayHello("John") { response in
	print("Received response from XPC service:", response)
}

RunLoop.main.run()


@objc protocol XPCServiceProtocol {
	func sayHello(_ name: String, withReply reply: @escaping (String) -> Void)
}
