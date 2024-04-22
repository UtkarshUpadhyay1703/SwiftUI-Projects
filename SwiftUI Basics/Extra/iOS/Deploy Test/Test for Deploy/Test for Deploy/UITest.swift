//
//  UITest.swift
//  Test for Deploy
//
//  Created by admin on 1/22/24.
//

import SwiftUI


struct UITest: View {
//	private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//	@State private var rectVal = 0.0
	
	private let colors: [Color] = [.red, .blue, .gray, .green];
	var body: some View {
		ZStack {
//			Rectangle()
//				.trim(from: 0, to: rectVal)
//				.rotation(.degrees(180))
//				.stroke(lineWidth: 30)
//				.fill(Color.red)
//				.frame(width: 200, height: 200, alignment: .center)
//				.onReceive(timer) { _ in
//					if rectVal == 1{
//						rectVal = 0.981
//					}else if rectVal == 0.981{
//						rectVal = 0.0
//					}else {
//						if rectVal == 0.8 {
//							rectVal = 0.981
//						}else{
//							rectVal += 0.2
//						}
//					}
//				}
//				.animation(.spring(response: 1, blendDuration: 1), value: rectVal)
			
//			TabView{
//				ForEach(colors, id: \.self) { color in
//					ZStack{
//						color
//						Text(color.description)
//							.font(.title)
//					}
//				}
//
//			}
//			.tabViewStyle(.page(indexDisplayMode: .automatic))
//			.indexViewStyle(.page(backgroundDisplayMode: .always))
			Color.red
//				.edgesIgnoringSafeArea(.all)
			
				Text("Loading ...")
					.font(.title)
					.foregroundColor(.white)
					.multilineTextAlignment(.center)
					
		}
//		.background(.red)
	}
}

struct UITest_Previews: PreviewProvider {
	static var previews: some View {
		UITest()
	}
}
