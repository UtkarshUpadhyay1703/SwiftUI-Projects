//
//  ToastView.swift
//  Notes Mac iOS (iOS)
//
//  Created by admin on 11/3/23.
//

import SwiftUI

struct ToastView: View {
    var type: ToastStyle
    var title: String
    var message: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Image(systemName: type.iconFileName)
                        .foregroundColor(type.themeColor)
                        .font( isMacOS() ? .system(size: 14, weight: .semibold) : .title2.bold())
                    
                    VStack(alignment: .leading){
                        Text(title)
                            .font( isMacOS() ? .system(size: 14, weight: .semibold) : .title2.bold())
                            .padding(3)
                            .background(type.themeColor)
                            .cornerRadius(5)
                        
                        Text(message)
                            .font(isMacOS() ? .system(size: 12) : .title3)
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                    
                    Spacer(minLength: 10)
                }
                .padding()
            }
            .background(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 1)
            .padding(.horizontal, 16)
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ToastView(type: .error, title: "ERROR", message: "Its time for a war")
            
            ToastView(type: .info, title: "INFO", message: "Please first understand info then purchase")
        }
    }
}
