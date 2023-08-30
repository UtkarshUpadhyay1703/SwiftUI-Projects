//
//  ContentView.swift
//  Location Based Notification
//
//  Created by admin on 8/30/23.
//


//MARK: NotWorking
import SwiftUI
import UserNotifications
import CoreLocation

struct ContentView: View {
    @StateObject private var locationDelegate = LocationDelegate()
    @State private var locationManager = CLLocationManager()
    
    let coordinate = CLLocationCoordinate2D(
        latitude: 20,
        longitude: 20
    )
    func check() -> Bool {
        if coordinate.latitude == locationDelegate.userLocation?.latitude && coordinate.longitude == locationDelegate.userLocation?.longitude {
            print("Reached Location")
            return true
        }
        return false
    }
    
    //MARK: Location
    func ScheduleNotificationOnLocation() {
        if check() {
            print("gone to the notification check")
            let content = UNMutableNotificationContent()
            content.title = "This is Location Notification"
            content.subtitle = "On approaching a specific location"
            content.sound = .default
            content.badge = 1
            
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
        }
    }
    
    var body: some View {
        Button(action: {
            ScheduleNotificationOnLocation()
        }, label: {
            Text("Notification On Location Basis")
        })
            .onAppear{
                locationManager.delegate = locationDelegate
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
