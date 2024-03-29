//
//  ToastView.swift
//  Toast Usage
//
//  Created by admin on 10/9/23.
//

import SwiftUI

struct ToastView: View {
    var type: ToastStyle
    var title: String
    var message: String
    var onCancleTapped: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading){
            ColorChangingStrip( rectangleColor: type.themeColor, animationDuration: 10)
            HStack(alignment: .top){
                Image(systemName: type.iconFileName)
                    .foregroundColor(type.themeColor)
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(3)
                        .background(type.themeColor)
                        .cornerRadius(5)
                    
                    Text(message)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black.opacity(0.6))
                }
                
                Spacer(minLength: 10)
                
                Button {
                    //Todo
                    onCancleTapped()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .background(.white)
        .overlay(
        Rectangle()
            .fill(type.themeColor)
            .frame(width: 6)
            .clipped(),
        alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ToastView(type: .error, title: "ERROR", message: "Its time for a war") {}
            
            ToastView(type: .info, title: "INFO", message: "Please first understanf info then purchase"){}
        }
    }
}
