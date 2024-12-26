//
//  ViewController.swift
//  NSXPC Receiver
//
//  Created by admin on 4/30/24.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
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

class Receiver: NSObject, MessageProtocol {
	func sendMessage(_ message: String) {
		print("Received message: \(message)")
	}

	func startListener() {
		print("Reciever startListener");
		let listener = NSXPCListener(machServiceName: "com.example.ReceiverApp")
		listener.delegate = self
		listener.resume()
	}
}

extension Receiver: NSXPCListenerDelegate {
	func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
		newConnection.exportedInterface = NSXPCInterface(with: MessageProtocol.self)
		newConnection.exportedObject = self
		newConnection.resume()
		return true
	}
}
