//
//  LandingPage.swift
//  Tic Tac Toe
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct LandingPage: View {
    @State private var singleMode: Mode = .basic
    var body: some View {
        GeometryReader { geometry in
            VStack{
//#if !os(watchOS)
                Spacer()
//#endif
                HStack{
                    Spacer()
                    NavigationLink {
                        GameView(isSinglePlayerMatch: true,selectedMode: singleMode)
                    } label: {
                        VStack{
                            
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                .foregroundColor(.black)
                            
                            Text("1 Person")
#if !os(watchOS)
                                .font(.title)
#else
                                .font(.title3)
#endif
                                .bold()
                                .foregroundColor(.blue)
                            
                        }
                        .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2)
                        .background(.yellow)
                        .cornerRadius(10)
                    }
                    NavigationLink {
#if os(watchOS)
                        GameView(isSinglePlayerMatch: false)
#else
                        SecondPersonSignUp()
#endif
                    } label: {
                        VStack{
                            Image(systemName: "person.2.circle")
                                .resizable()
                                .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                .foregroundColor(.black)
                            Text("2 People")
#if !os(watchOS)
                                .font(.title)
#else
                                .font(.title3)
#endif
                                .bold()
                                .foregroundColor(.blue)
                        }
                        .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2)
                        .background(.yellow)
                        .cornerRadius(10)
                    }
#if !os(watchOS)
                    Spacer()
#endif
                }
#if !os(watchOS)
                Text("If Playing Singles then Pick Difficulty:")
                    .font(.title2)
#endif
                
                Picker(selection: $singleMode) {
                    ForEach(Mode.allCases, id: \.rawValue){mode in
#if !os(watchOS)
                        Text(mode.rawValue.capitalized)
                            .font(.title)
                            .tag(mode)
#else
                        Text(mode.rawValue.capitalized)
                            .font(.title3)
                            .tag(mode)
                        #endif
                        
                    }
                } label: {
                    Text("If Singles Difficulty:")
                        .font(.subheadline)
                }
                .pickerStyle(.automatic)
                #if os(watchOS)
                .frame(height: 80)
                #endif
                
#if !os(watchOS)
                Spacer()
#endif
            }
                    .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .background(.red)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        //#if os(iOS)
        //        LandingPage()
        //                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        //                .previewDisplayName("iPhone 13 Pro Max")
        //            #elseif os(watchOS)
        LandingPage()
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 7 - 45mm"))
            .previewDisplayName("Apple Watch Series 7 - 45mm")
        //            #endif
    }
}
