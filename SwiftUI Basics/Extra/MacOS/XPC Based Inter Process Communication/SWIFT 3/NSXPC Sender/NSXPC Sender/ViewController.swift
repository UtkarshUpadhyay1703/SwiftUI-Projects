//
//  ViewController.swift
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let sender = Sender()
		sender.send(message: "123456")
		

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
}


import Foundation

@objc protocol MessageProtocol {
	func sendMessage(_ message: String)
}

class Sender: NSObject {
	private let connection: NSXPCConnection

	override init() {
		print("Sender init");
		connection = NSXPCConnection(serviceName: "com.example.ReceiverApp")
		super.init()
		connection.remoteObjectInterface = NSXPCInterface(with: MessageProtocol.self)
		connection.resume()
	}

	func send(message: String) {
		if let proxy = connection.remoteObjectProxyWithErrorHandler({ error in
			print("Failed to connect: \(error)")
		}) as? MessageProtocol {
			print("connect: \(message)")
			proxy.sendMessage(message)
		}
	}
}

