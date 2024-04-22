//
//  OTPView.swift
//  Test for Deploy
//
//  Created by admin on 1/11/24.
//

import SwiftUI

struct OTPView: View {
	@State var otpField: String = ""
	@State var isFocused = false
	
	let textBoxWidth: CGFloat = 36
	let textBoxHeight: CGFloat = 36
	let spaceBetweenBoxes: CGFloat = 10
	let paddingOfBox: CGFloat = 1
	var textFieldOriginalWidth: CGFloat {
		(textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
	}
    var body: some View {
		ZStack {
			Text("Hello, World!")
			TextField("", text: $otpField)
				.frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
				.textContentType(.oneTimeCode)
				.foregroundColor(.clear)
				.accentColor(.clear)
				.background(Color.clear)
				.keyboardType(.numberPad)
				.onChange(of: otpField, perform: {
					otpField = String($0.prefix(6))
				})
		}
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
