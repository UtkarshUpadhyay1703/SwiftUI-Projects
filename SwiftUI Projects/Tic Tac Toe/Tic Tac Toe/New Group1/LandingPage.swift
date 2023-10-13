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
                    Spacer()
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
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.blue)
                                                                
                            }
                            .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2)
                            .background(.yellow)
                            .cornerRadius(10)
                        }
                        NavigationLink {
                            SecondPersonSignUp()
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
                    
                    Text("If Playing Singles then Pick Difficulty:")
                        .font(.title2)
                        
                    Picker(selection: $singleMode) {
                        ForEach(Mode.allCases, id: \.rawValue){mode in
                            Text(mode.rawValue.capitalized)
                                .font(.title)
                                .tag(mode)
                        }
                    } label: {
                        Text("Picker")
                    }
                    .pickerStyle(.automatic)
                    
                    Spacer()
                }
            }
            .background(.red)
        }
    }

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
