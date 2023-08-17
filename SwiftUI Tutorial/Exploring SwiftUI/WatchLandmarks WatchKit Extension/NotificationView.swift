//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by admin on 7/25/23.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack{
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? " You are within 5 km of one of your favorite landmark")
                .font(.caption)
        }
//        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NotificationView()
            NotificationView(title: "Mathura", message: "You are near the birth place of Lord Krishna", landmark: ModelData().landmarks[1])
        }
    }
}
