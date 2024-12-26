//
//  AppDelegate.swift
//  NSXPC Receiver
//
//  Created by admin on 4/30/24.
//

//import Cocoa
//
//@main
//class AppDelegate: NSObject, NSApplicationDelegate {
//
//
//
//
//	func applicationDidFinishLaunching(_ aNotification: Notification) {
//		// Insert code here to initialize your application
//	}
//
//	func applicationWillTerminate(_ aNotification: Notification) {
//		// Insert code here to tear down your application
//	}
//
//	func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
//		return true
//	}
//
//
//}


import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
	var receiver: Receiver?
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		receiver = Receiver()
		receiver?.startListener()
	}
	
	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
		return true
	}
}


