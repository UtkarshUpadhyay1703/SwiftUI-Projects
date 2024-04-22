//
//  NotificationManager.swift
//  Notes Mac iOS
//
//  Created by admin on 11/10/23.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    
    //MARK: Request Authorization
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error in user notification \(error)")
            }else {
                print("User Authorization is successful")
            }
        }
    }
    
    func scheduledNotificationOnSpecificDate(identifier: String, title: String, subTitle: String, date: Date){
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.subtitle = subTitle
//        content.sound = .default
//        content.badge = 1
//
//        var dateComponent: DateComponents{
//            let calendar = Calendar.current
//            return calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//        }
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
//
//        let request = UNNotificationRequest(
//            identifier: identifier,
//            content: content,
//            trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error{
//                print("Error in showing User Notifications", error)
//            }else {
//                print("Successfully scheduled the user Notification")
//            }
//        }
    }
    
    func cancleSpecificLocalNotification(identifier: String){
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            let matchingRequest = requests.filter{ $0.identifier == identifier}
            if matchingRequest.isEmpty {
                print("No matching notification found with identifier: \(identifier)")
            }else {
                // Remove the notification with the specified identifier
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
                print("Notification canceled successfully!")
            }
        }
    }
}
