//
//  ContentView.swift
//  Path Use
//
//  Created by admin on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        
//        Path { path in
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
//        }
//        .stroke(.blue, lineWidth: 10)
        
        
//        GeometryReader{geometry in
//            Path{ path in
//                let center = CGPoint(x: (geometry.size.width/2 - 10), y: geometry.size.height/2)
//                let radius = min( (geometry.size.width - 20), geometry.size.height)/2
//                path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
//            }
//
//        }
        
//        GeometryReader{ geometry in
//            Path{ path in
//                let width = min(geometry.size.width, geometry.size.height)
//                let height = width * 0.75
//                let spacing = width * 0.030
//                let middle = width * 0.5
//                let topWidth = width * 0.226
//                let topHeight = height * 0.488
//
//
//                path.addLines([
//                    CGPoint(x: middle, y: spacing),
//                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
//                    CGPoint(x: middle, y: topHeight / 2 + spacing),
//                    CGPoint(x: middle + topWidth, y: topHeight - spacing)
////                    CGPoint(x: middle, y: spacing)
//                ])
//
//                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
//                                path.addLines([
//                                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
//                                    CGPoint(x: spacing, y: height - spacing),
//                                    CGPoint(x: width - spacing, y: height - spacing),
//                                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
//                                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
//                                ])
//            }
//        }
  
        ZStack {
           Circle().fill(.green)
           Circle().fill(.yellow).scaleEffect(0.8)
           Circle().fill(.orange).scaleEffect(0.6)
           Circle().fill(.red).scaleEffect(0.4)
        }
            
            
//            GeometryReader{ geometry in
//            Path{ path in
//                path.move(to: CGPoint(x: 100.0, y: 100.0))
//                path.addLine(to: CGPoint(x: 0.0, y: 0.0))
//                path.addLine(to: CGPoint(x: 200.0, y: 100.0))
//                path.move(to: CGPoint(x: 0.0, y: 0.0))
//                path.addLine(to: CGPoint(x: 0.0, y: 100.0))
//                path.addLine(to: CGPoint(x: 50.0, y: 100.0))
//            }
//        }
        
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
