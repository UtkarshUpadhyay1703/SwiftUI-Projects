//
//  Colors.swift
//  GridItems
//
//  Created by admin on 7/28/23.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 50.0)
            .fill(
                //                Color(UIColor.secondarySystemBackground)
                //                Color("CustomColors")
                
                //                LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .topLeading, endPoint: .topTrailing)
                
                
                //                RadialGradient(gradient: Gradient(colors: [Color.white,Color.pink]), center: .center, startRadius: 23, endRadius: 114)
                
                
                AngularGradient(gradient: SwiftUI.Gradient(colors: [Color.pink, Color.green]), center: .top, angle: .degrees(180))
            )
            .frame(width: 200, height: 200, alignment: .top)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
            .preferredColorScheme(.dark)
    }
}
