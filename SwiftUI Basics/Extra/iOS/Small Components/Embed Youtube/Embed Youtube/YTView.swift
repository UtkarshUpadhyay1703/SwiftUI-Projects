//
//  YTView.swift
//  Embed Youtube
//
//  Created by admin on 9/7/23.
//

import SwiftUI
import WebKit

struct YTView: View {
    let id: String
    var body: some View {
        VStack{
        Video(videoId: id)
            .frame(width: 350, height: 200)
            .cornerRadius(10)
            .padding(.horizontal, 24)
        }
    }
}

struct YTView_Previews: PreviewProvider {
    static var previews: some View {
        YTView(id: "uo1UD63d8i8")
    }
}

struct Video: UIViewRepresentable{
    let videoId: String
    //For Normal Embed Youtube Video
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let YouTubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = true
        uiView.load( URLRequest(url: YouTubeURL))
    }
}
