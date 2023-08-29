//
//  Swipe Drag.swift
//  MagnificationGesture Use
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct Swipe_Drag: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                Image(systemName: "chevron.up")
                Text("Sign-up")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct Swipe_Drag_Previews: PreviewProvider {
    static var previews: some View {
        Swipe_Drag()
    }
}
