//
//  LocationDelegate.swift
//  Location Based Notification
//
//  Created by admin on 8/30/23.
//

import Foundation
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var userLocation: CLLocationCoordinate2D?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            print("Recieved Location Update => Latitude: \(location.latitude) Longitude: \(location.longitude)")
            userLocation = location
        }
    }
}
