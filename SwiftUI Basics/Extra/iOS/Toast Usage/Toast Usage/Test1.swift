//
//  Test1.swift
//  Toast Usage
//
//  Created by admin on 11/6/23.
//
import SwiftUI

struct Color1ChangingStrip: View {
    @State private var xOffset: CGFloat = 1.0

    let animationDuration: Double = 5.0

    var body: some View {
        GeometryReader { geometry in
            HStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]),
                               startPoint: .trailing,
                               endPoint: .leading)
                    .frame(width: geometry.size.width, height: 50) // Adjust the height as needed
                    .offset(x: xOffset * geometry.size.width, y: 0)
                    .animation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false))
            }
        }
        .background(.red)
        .onAppear {
            withAnimation {
                xOffset = 0.0
            }
        }
    }
}


struct color_Previews: PreviewProvider {
    static var previews: some View {
        Color1ChangingStrip()
    }
}
