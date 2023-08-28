//
//  RotationGesture.swift
//  MagnificationGesture Use
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct Rotation: View {
    @State private var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title.bold())
            .frame(width:300, height: 150)
            .background(.red).cornerRadius(10)
            .foregroundColor(.green)
            .rotationEffect(angle)
            .gesture(
            RotationGesture()
                .onChanged { value in
                    angle = value
                }
                .onEnded { value in
                    angle = Angle(degrees: 0)
                }
            )
    }
}

struct Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Rotation()
    }
}
