//
//  Drag.swift
//  MagnificationGesture Use
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct Drag: View {
    @State private var offSet: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack{
                Text("\(abs(offSet.width))")
                Spacer()
            }
            
            Rectangle()
                .frame(width: 300, height: 600)
                .offset(offSet)
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                offSet = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                offSet = .zero
                            }
                        }
                )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        // abs is for converting negative to positive number
        let currentAmount = abs(offSet.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offSet.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAge: Double = 10
        return percentageAsDouble * maxAge
    }
}

struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        Drag()
    }
}
