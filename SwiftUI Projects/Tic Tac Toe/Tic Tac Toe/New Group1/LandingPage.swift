//
//  LandingPage.swift
//  Tic Tac Toe
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct LandingPage: View {    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink {
                            GameView(isSinglePlayerMatch: true)
                        } label: {
                            VStack{
                                
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                    .foregroundColor(.black)
                                
                                Text("1 Person")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.blue)
                                    
                                    
                            }
                            .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2)
                            .background(.yellow)
                            .cornerRadius(10)
                        }
                        NavigationLink {
                            GameView(isSinglePlayerMatch: false)
                        } label: {
                            VStack{
                                Image(systemName: "person.2.circle")
                                    .resizable()
                                    .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                    .foregroundColor(.black)
                                Text("2 People")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.blue)
                            }
                            .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2)
                            .background(.yellow)
                            .cornerRadius(10)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .background(.red)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
