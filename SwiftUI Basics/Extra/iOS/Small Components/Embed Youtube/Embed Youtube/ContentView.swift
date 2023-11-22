//
//  ContentView.swift
//  Embed Youtube
//
//  Created by admin on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var textField: String = ""
    @State private var buttonClicked: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("To play youtube video please enter url in the text fieled below:")
                    .font(.title2)
                TextField("Enter Video URL....", text: $textField)
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(10)
                
                Button(action: {
                    buttonClicked = true
                }, label: {
                    Text("Submit")
                        .font(.title2.bold())
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(10)
                })
                if buttonClicked{
                    if checkURL(url: textField) {
                        Home(url: textField)
                    } else {
                        Text("Incorrect URL !!!!!!!")
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Youtube Video Player")
        }
        .background(Color.red)
    }
    
    func checkURL(url: String) -> Bool{
        let fixedURL = "https://www.youtube.com/watch?v="
        
        guard url.count == 43,
              url.starts(with: fixedURL)
        else { return false}
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
