//
//  ColorChangingStrip.swift
//  Notes Mac iOS
//
//  Created by admin on 11/3/23.
//

import SwiftUI


struct ColorChangingStrip: View {
    @State private var xOffset: CGFloat = 1.0
    @State var stripColor: Color
    @State var animationDuration: Double

    var body: some View {
        GeometryReader { geometry in
            HStack {
                LinearGradient(gradient: Gradient(colors: [Color.whiteColor, stripColor]),
                               startPoint: .trailing,
                               endPoint: .leading)
                    .frame(width: geometry.size.width, height: 15) // Adjust the height as needed
                    .offset(x: xOffset * geometry.size.width, y: 0)
                    .animation(Animation.linear(duration: animationDuration))
            }
        }
        .background(Color.whiteColor)
        .border(Color.black, width: 3)
        .frame(width: .infinity, height: 15)
        
        .cornerRadius(5)
        
        .onAppear {
            withAnimation {
                xOffset = 0.0
            }
        }
        
    }
}


struct colorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChangingStrip(stripColor: .blue ,animationDuration: 5.0)
    }
}
