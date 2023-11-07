//
//  DynamicRcatangle.swift
//  Toast Usage
//
//  Created by admin on 11/3/23.

import SwiftUI


struct ColorChangingStrip: View {
    @State private var offset: CGFloat = 1.0
    @State var rectangleColor: Color
    
    @State var animationDuration: Double = 5.0
    
    var body: some View {
        HStack {
            LinearGradient(gradient: Gradient(colors: [rectangleColor, Color.white]),
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(width: offset * UIScreen.main.bounds.width)
            
            Spacer()
        }
        .frame(width: .infinity, height: 10, alignment: .topLeading)
        .onAppear() {
            withAnimation(.linear(duration: animationDuration)) {
                offset = 0.0
            }
        }
    }
}


struct colorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChangingStrip(rectangleColor: Color.red)
    }
}
