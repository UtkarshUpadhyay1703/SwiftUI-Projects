//
//  Alerts.swift
//  Tic Tac Toe
//
//  Created by admin on 10/10/23.
//

import SwiftUI
import UserNotifications

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
//#if os(watchOS)
//    var notificationViewModel: NotificationViewModel
//
//    #endif
//    #if !os(watchOS)
    static let humanWin = AlertItem(title: Text("You Win !!!!"), message: Text("You are so smart you beat your own AI"), buttonTitle: Text("Hell Yeah"))
    
    static let computerWin = AlertItem(title: Text("You Lost !!!!"), message: Text("You created a super AI"), buttonTitle: Text("Rematch"))
    
    static let firstPersonWin = AlertItem(title: Text("Person 1 Won !!!!!"), message: Text("Person 1 is so Smart"), buttonTitle: Text("Courage To Rematch"))
    
    static let secondPersonWin = AlertItem(title: Text("Person 2 Won !!!!!"), message: Text("Person 2 is so Smart"), buttonTitle: Text("Courage To Rematch"))
    
    static let draw = AlertItem(title: Text("Draw !!!!!"), message: Text("What a battel of wits we have here...."), buttonTitle: Text("Try Again"))
//    #else
//
//    static let humanWin = notificationViewModel.sendLocalNotification(title: "You Win !!!!", body: "You are so smart you beat your own AI")
//
//    static let computerWin = notificationViewModel.sendLocalNotification(title: "You Lost !!!!", body: "You created a super AI")
//
//    static let firstPersonWin = notificationViewModel.sendLocalNotification(title: "Person 1 Won !!!!!", body: "Person 1 is so Smart")
//
//    static let secondPersonWin = notificationViewModel.sendLocalNotification(title: "Person 2 Won !!!!!", body: "Person 2 is so Smart")
//
//    static let draw = notificationViewModel.sendLocalNotification(title: "Draw !!!!!", body: "What a battel of wits we have here....")
//
//    #endif
}

//struct WatchAlert {
//func sendLocalNotification(title: String, body: String) {
//    // Request authorization if not already authorized
//    UNUserNotificationCenter.current().getNotificationSettings { settings in
//        if settings.authorizationStatus == .authorized {
//            // Prepare your notification content
//            let content = UNMutableNotificationContent()
//            content.title = title
//            content.body = body
//
//            // Create a trigger for when you want to show the notification
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0, repeats: false)
//
//            // Create a request using your content and trigger
//            let request = UNNotificationRequest(identifier: "uniqueIdentifier", content: content, trigger: trigger)
//
//            // Schedule the notification
//            UNUserNotificationCenter.current().add(request) { error in
//                if let error = error {
//                    print("Error scheduling notification: \(error)")
//                } else {
//                    print("Notification scheduled successfully")
//                }
//            }
//        } else {
//            print("User hasn't granted notification permissions")
//        }
//    }
//}
//}
