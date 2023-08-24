//
//  ContentView.swift
//  Local Notification Usage
//
//  Created by admin on 8/24/23.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    //MARK: Request
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("error = \(error)")
            }else{
                print("Success")
            }
        }
    }
    
    //MARK: Time, Calendar, Location
    func ScheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification app"
        content.subtitle = "This was too easy"
        content.sound = .default
        content.badge = 1
        
//        We have 3 types of Local Notifications:
        
//        Time: after a specified interval of time.
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
//        Calander: On a specified Date and Time.
        var dateComponents = DateComponents()
        //As this time is in 24-hour format then this is called
        dateComponents.hour = 16
        dateComponents.minute = 41
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
//        Location: On approaching a specified location.
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 120,
            longitude: 120
        )
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancleNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func notificationOnCustomDate(customDate: Date){
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification app"
        content.subtitle = "This was too easy"
        content.sound = .default
        content.badge = 1
        
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: customDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
//        Location: On approaching a specified location.
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
        
    }
    
}

struct ContentView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 40){
            Button("Request Permission"){
                NotificationManager.instance.requestAuthorization()
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            Button("Schedule Notification"){
                NotificationManager.instance.ScheduleNotification()
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            Button("Increase Badge") {
                UIApplication.shared.applicationIconBadgeNumber += 1
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            DatePicker("Pick a date : ", selection: $selectedDate, in: Date()...)
            
            Button("Custom Scheduled date"){
                NotificationManager.instance.notificationOnCustomDate(customDate: selectedDate)
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            Button("Cancle Notification"){
                NotificationManager.instance.cancleNotification()
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
