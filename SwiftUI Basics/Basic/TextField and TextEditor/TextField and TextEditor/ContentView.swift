//
//  ContentView.swift
//  TextField and TextEditor
//
//  Created by admin on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var arrNames: [String] = []
    @State private var about: String = "This should be greater than 150 letters..."
    @State private var age: Double = 0.6
    @State private var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Enter Full Name:")
                .padding()
                .font(.title)
            TextField("Name should greater than 3 letters", text: $username)
                .frame(height: 50)
                .border(.blue)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .font(.headline)
                .foregroundColor(.orange)
            
            Text("Enter your age: \(age)")
                .foregroundColor(color)
            
//            Slider(value: $age,
//                   in: 0...150,
//                   step: 0.1,label: {
//
//            },
//                   minimumValueLabel:
//                    {Text("0.6666")},
//                   maximumValueLabel: {
//                Text("150")
//            },
//                   onEditingChanged: { (_) in
//                color = .green
//            })
            
            Slider(value: $age, in: 0...150)
            
            Text("Tell me about your self")
            TextEditor(text: $about)
                .frame (height: 250)
                .border(.gray)
            Button(action: {
                isAppropriate()
                //                showUserName(arr: arrNames)
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background((isAppropriate()) ? .orange : .black )
                    .font(.headline)
            })
                .disabled(!isAppropriate())
            ForEach(arrNames, id: \.self){ name in
                Text("name = \(name)")
            }
            Text("About: \(about)")
            
            // Tap Gestures
            Text("Submit")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .border(.brown)
                .cornerRadius(15)
                .background(.blue)
                .foregroundColor(color)
                .onTapGesture(count: 2, perform: {
                    color = .purple
                })
            
            
            //Tap Gestures
            
            
            
            
            
//            Spacer()
        }
        .padding()
    }
    
    //    func showUserName(arr: [String]){
    //        ForEach(arr, id: \.self){ name in
    //            Text(name)
    //        }
    //    }
    
    func isAppropriate() -> Bool{
        if ((username.count > 3) && (about.count > 150))  {
            arrNames.append(username)
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
