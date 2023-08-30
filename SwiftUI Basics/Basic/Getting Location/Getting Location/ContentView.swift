//
//  ContentView.swift
//  Getting Location
//
//  Created by admin on 8/30/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationDelegate = LocationDelegate()
    @State private var locationManager = CLLocationManager()
    
    var body: some View {
        VStack {
            if let location = locationDelegate.userLocation {
                Text("Latitude: \(location.latitude), Longitude: \(location.longitude)")
                    .font(.headline)
                    .padding()
            } else {
                Text("Fetching location...")
                    .font(.headline)
                    .padding()
            }
        }
        .onAppear {
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

