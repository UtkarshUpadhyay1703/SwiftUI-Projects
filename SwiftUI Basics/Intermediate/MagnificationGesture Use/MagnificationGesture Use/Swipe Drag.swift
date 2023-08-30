//
//  Swipe Drag.swift
//  MagnificationGesture Use
//
//  Created by admin on 8/28/23.
//

import SwiftUI

struct Swipe_Drag: View {
    @State private var startingOffSetY: CGFloat = UIScreen.main.bounds.height * 0.89
    @State private var currentOffSetY: CGFloat = 0
    @State private var endingOffSetY: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            MySignUpView()
                .offset(y: startingOffSetY)
                .offset(y: currentOffSetY)
                .offset(y: endingOffSetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                currentOffSetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            
                            
                            withAnimation(.spring()){
                                if currentOffSetY < -150 {
                                    endingOffSetY = -startingOffSetY
                                    currentOffSetY = 0
                                } else if endingOffSetY != 0 && currentOffSetY > 150 {
                                    endingOffSetY = 0
                                    currentOffSetY = 0
                                }
                                else{
                                    currentOffSetY = 0
                                }
                            }
                        }
                )
            Text("\(currentOffSetY)")
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Swipe_Drag_Previews: PreviewProvider {
    static var previews: some View {
        Swipe_Drag()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack{
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign-up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the descreption of my app. This is my favorite cource regarding gestures where I learned about different types of gestures.")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
