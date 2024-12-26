//
//  AppDelegate.swift
//  XPCServices
//
//  Created by admin on 4/30/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
	var receiver: Receiver?
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		receiver = Receiver()
		receiver?.startListener()
	}
}
