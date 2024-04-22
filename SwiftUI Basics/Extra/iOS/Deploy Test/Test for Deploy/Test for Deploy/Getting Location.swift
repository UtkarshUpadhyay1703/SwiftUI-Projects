//
//  Getting Location.swift
//  Test for Deploy
//
//  Created by admin on 1/30/24.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
	private var locationManager = CLLocationManager()
	@Published var userLocation: CLLocation?

	override init() {
		super.init()
		setupLocationManager()
	}

	func setupLocationManager() {
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		locationManager.requestLocation()
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.first {
			userLocation = location
		}
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Location error: \(error.localizedDescription)")
	}
}

struct Getting_Location: View {
	@ObservedObject var locationManager = LocationManager()

	var body: some View {
		VStack {
			if let location = locationManager.userLocation {
				Text("Latitude: \(location.coordinate.latitude)")
				Text("Longitude: \(location.coordinate.longitude)")
			} else {
				Text("Location not available")
			}
		}
	}
}

struct LocationView_Previews: PreviewProvider {
	static var previews: some View {
		Getting_Location()
	}
}

