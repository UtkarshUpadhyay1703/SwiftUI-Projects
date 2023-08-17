//
//  PageView.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/24/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
//        ZStack{
        PageViewController(pages: pages, currentPage: $currentPage)
//            HStack(alignment: .center, spacing: 100) {
//            Button("Left") {
//                currentPage -= 1
//            }
//            Spacer()
//                Button("Right") {
//                currentPage += 1
//                }
//            }
//        }
//        .foregroundColor(.green)
//        .font(.title)
            
//        Text("Current Page = \(currentPage)")
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
    }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio( 3 / 2 ,contentMode: .fit)
    }
}
