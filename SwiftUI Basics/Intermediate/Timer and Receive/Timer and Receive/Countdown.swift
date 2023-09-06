//
//  Countdown.swift
//  Timer and Receive
//
//  Created by admin on 9/5/23.
//

import SwiftUI

struct Countdown: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var count: Int = 10
    @State var finishedText:String? = nil
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.green, Color.blue, Color.orange], center: .center, startRadius: 100, endRadius: 200)
                .ignoresSafeArea()
            Text(finishedText ?? "\(count)")
                .font(.system(size: 50, weight: .semibold, design: .rounded))
        }
        .onReceive(timer) { _ in
            print("in")
            if count <= 1 {
                finishedText = "Wow!!!"
            }else{
                count -= 1
            }
        }
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown()
    }
}
