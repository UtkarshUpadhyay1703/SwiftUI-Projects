//
//  LocationDelegate.swift
//  Getting Location
//
//  Created by admin on 8/30/23.
//

import Foundation
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var userLocation: CLLocationCoordinate2D?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            print("Received location update: \(location.latitude), \(location.longitude)")
            userLocation = location
        }
    }
}
