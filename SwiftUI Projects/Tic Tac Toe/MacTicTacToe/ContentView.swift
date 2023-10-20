//
//  ContentView.swift
//  MacTicTacToe
//
//  Created by admin on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var singleMode: Mode = .veryEasy
    var body: some View {
        GeometryReader { geometry in
            VStack{
                //#if !os(watchOS)
//                Spacer()
                //#endif
                HStack{
//                    Spacer()
                    NavigationLink {
                        GameView(isSinglePlayerMatch: true,selectedMode: singleMode)
                    } label: {
                        VStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                .foregroundColor(.black)
                            
                            Text("1 Person")
                        }
                    }
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
