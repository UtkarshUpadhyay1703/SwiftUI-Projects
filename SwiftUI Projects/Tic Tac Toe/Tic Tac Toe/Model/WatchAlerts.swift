//
//  WatchAlerts.swift
//  Tic Tac Toe
//
//  Created by admin on 10/17/23.
//
//import SwiftUI
//import UserNotifications
//import WatchConnectivity

//class YourAppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Register your app delegate as a delegate for user notifications
//        UNUserNotificationCenter.current().delegate = self
//        print("YourAppDelegate didFinishLaunchingWithOptions")
//        // Other setup code...
//        return true
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        // Present the notification as an alert when the app is in the foreground
//        print("userNotificationCenter @escaping ")
//        completionHandler([.alert, .sound])
//    }
//}


import SwiftUI
import UserNotifications

class NotificationViewModel: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Authorization granted")
            }
        }
    }

    func sendLocalNotification(title: String, body: String) {
        requestAuthorization()
        
        // Prepare your notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body

        // Create a trigger for when you want to show the notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        // Create a request using your content and trigger
        let request = UNNotificationRequest(identifier: "uniqueIdentifier", content: content, trigger: trigger)

        // Schedule the notification
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
    
    // Implement the UNUserNotificationCenterDelegate method for foreground notifications
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Customize how the notification is presented when the app is in the foreground
        completionHandler([.alert, .sound])
    }
}
