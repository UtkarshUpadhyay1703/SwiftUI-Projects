//
//  ContentView.swift
//  Weather App
//
//  Created by admin on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    let weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
//                Text("Your location Coordinates are Longitude =  \(location.longitude) and Latitude = \(location.latitude)")
                
                if let weather = weather {
//                    Text("Weather data feached")
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.066, saturation: 1.0, brightness: 1.0))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
