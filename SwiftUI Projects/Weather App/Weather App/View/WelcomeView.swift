//
//  WelcomeView.swift
//  Weather App
//
//  Created by admin on 8/7/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
        VStack(spacing: 20){
            Text("Welcome to the Weather App")
                .font(.title.bold())
            Text("Please share your current location to get weather in your area")
                .padding()
        }
        .multilineTextAlignment(.center)
        .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
