//
//  PopUpTest.swift
//  Test for Deploy
//
//  Created by admin on 11/29/23.
//

import SwiftUI

struct PopUpTest: View {
    @State private var popUp = false
    var body: some View {
        VStack{
        Text("Hii")
            Button {
                popUp.toggle()
            } label: {
                Text("Click")
            }
            
        }
        .overlay{
            if popUp {
                PopUpDataView(popUp: $popUp)
                
            }
        }
    }
}

struct PopUpTest_Previews: PreviewProvider {
    static var previews: some View {
        PopUpTest()
    }
}

struct PopUpDataView: View {
    let listItems = (1...10).map { "Item \($0)" } // Example list items
    @Binding var popUp: Bool
    var body: some View{
        ScrollView{
        VStack{
            Text("Site: 1")
            Text("Site: 1")
            Text("Site: 1")
            Text("Site: 1")
            Text("Site: 1")
            Text("Site: 1")
        }
//        .padding(5)
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}

//struct PopUpEmptyDataView: View {
//    var body: some View{
//        ScrollView{
//        VStack{
//            Text("")
//        }
//        }
//    }
//}
