//
//  CircleImage.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/12/23.
//

import SwiftUI

struct CircleImage: View {    
    var image: Image
    
    var body: some View {
        image
            .resizable(resizingMode: .stretch)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 5)
                    .shadow(radius: 7)
            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("bird"))
    }
}
