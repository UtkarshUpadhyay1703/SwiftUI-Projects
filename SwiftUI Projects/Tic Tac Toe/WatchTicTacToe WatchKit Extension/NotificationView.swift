//
//  NotificationView.swift
//  WatchTicTacToe WatchKit Extension
//
//  Created by admin on 10/16/23.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    
    var body: some View {
        VStack{
            Text(title ?? "")
                .font(.title2)
                .foregroundColor(.yellow)
            Text("Hello ")
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "You")
    }
}
