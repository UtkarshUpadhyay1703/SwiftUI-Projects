//
//  ContentView.swift
//  GridItems
//
//  Created by admin on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    
    let column: [GridItem] = [
        //        GridItem(.flexible(), spacing: nil, alignment: nil)
        //        GridItem(.adaptive(minimum: 50, maximum: 300))
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        //        Colors()
        ScrollView{
            //        Rectangle()
            //            .frame(height: 400)
            //            .foregroundColor(.white)
            //        LazyVGrid(columns: column) {
            //            ForEach(1..<51){index in
            //                Rectangle()
            //                    .frame(height: 100)
            //            }
            //        }
            LazyVGrid(
                columns: column, alignment: .center, spacing: 6, pinnedViews: [],
                content: {
                    Section(content: {
                        ForEach(1..<50){ index in
                        Rectangle()
                        .frame(height: 100)
                    }
                    }, header: { Text("Section - 1")
                            .foregroundColor(.green)
                            .font(.title)
                            .frame(width: .infinity, alignment: .leading)
                            .background(Color.orange)
                            .padding()
                    })
                    Section(content: {
                        ForEach(1..<50){ index in
                        Rectangle()
                        .frame(height: 100)
                    }
                    }, header: { Text("Section - 2")
                            .foregroundColor(.orange)
                            .font(.title)
                            .frame(width: .infinity, alignment: .leading)
                            .background(Color.green)
                            .padding()
                    })
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .preferredColorScheme(.dark)
    }
}
