//
//  Home.swift
//  Embed Youtube
//
//  Created by admin on 9/7/23.
//

import SwiftUI

struct Home: View {
    var urlString:String
    @State var idString:String?
    
    init(url: String){
        urlString = url
    }
    
    func getId(url:String) {
            idString = String(url.suffix(11))
        print("Id = \(idString ?? "")")
    }
    
    var body: some View {
        VStack{
            Divider()
            Text("Videos")
                YTView(id: idString ?? "")
        }
        .onAppear{
            getId(url: urlString)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(url: "https://www.youtube.com/watch?v=uo1UD63d8i8")
    }
}
