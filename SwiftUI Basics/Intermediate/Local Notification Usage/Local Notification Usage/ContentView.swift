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
    
    // Time, Calendar, Location
    
    //MARK: Time
    func ScheduleNotificationWithDelay() {
        let content = UNMutableNotificationContent()
        content.title = "10-Sec Delay Notification"
        content.subtitle = "This is delay notification of 10 sec"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        //You can repeat also but time should be greater than 1 minute
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    //MARK: Calendar Fixed Date
    func scheduledNotificationOnSpecificDate(){
        let content = UNMutableNotificationContent()
        content.title = "This is Calendar Notification"
        content.subtitle = "Custom Defined Notification"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = 18
        dateComponents.minute = 20
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    //MARK: Calendar Custom
    func notificationOnCustomDate(customDate: Date){
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification app"
        content.subtitle = "This was too easy"
        content.sound = .default
        content.badge = 1
        
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: customDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    //MARK: Location
    func ScheduleNotificationOnLocation() {
        let content = UNMutableNotificationContent()
        content.title = "This is Location Notification"
        content.subtitle = "On approaching a specific location"
        content.sound = .default
        content.badge = 1
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 50,
            longitude: 50
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
    
    //MARK: Cancle All Notifications
    func cancleNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct ContentView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 40){
            //MARK: Request
            Button("Request Permission"){
                NotificationManager.instance.requestAuthorization()
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            //MARK: Time
            Button("Schedule 10-Sec Delay Notification"){
                NotificationManager.instance.ScheduleNotificationWithDelay()
            }
            .font(.title2.bold())
            .frame(width: 400, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            //MARK: Calender Fixed
            Button("Schedule Calendar time Notification"){
                NotificationManager.instance.scheduledNotificationOnSpecificDate()
            }
            .font(.title2.bold())
            .frame(width: 400, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            DatePicker("Pick a date : ", selection: $selectedDate, in: Date()...)
            
            //MARK: Calendar Custom
            Button("Custom Scheduled date Notification"){
                NotificationManager.instance.notificationOnCustomDate(customDate: selectedDate)
            }
            .font(.title2.bold())
            .frame(width: 400, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            //MARK: Location
            //But not working
            Button("Schedule Location Notification"){
                NotificationManager.instance.ScheduleNotificationOnLocation()
            }
            .font(.title2.bold())
            .frame(width: 400, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            //MARK: Increase Badge
            Button("Increase Badge") {
                UIApplication.shared.applicationIconBadgeNumber += 1
            }
            .font(.title2.bold())
            .frame(width: 250, height: 50)
            .border(.brown, width: 10)
            .foregroundColor(.red)
            .background(.yellow)
            
            //MARK: 
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
