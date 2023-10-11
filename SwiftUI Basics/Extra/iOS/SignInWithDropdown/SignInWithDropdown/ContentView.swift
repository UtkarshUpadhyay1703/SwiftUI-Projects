//
//  ContentView.swift
//  SignInWithDropdown
//
//  Created by admin on 10/11/23.
//

import SwiftUI
struct ContentView: View {
    @State private var loginButtonClicked = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                if loginButtonClicked{ logIn()}
                VStack{
                    Text("Hello")
                    fakeView()
                }
                .toolbar{
                    Button {
                        loginButtonClicked.toggle()
                    } label: {
                        Text("LogIn")
                    }
                }
            }
            Spacer()
        }
    }
}

struct fakeView: View {
    
    var body: some View {
        VStack{
            ForEach(0..<15){ index in
                Text("India v/s Pakistan \(index)")
                    .bold()
                    .foregroundColor(.yellow)
                    .font(.title)
                    .frame(width: 400, height: 50)
                    .background(.red)
                
            }
        }
    }
}

struct logIn: View {
    @State private var name: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack{
            Text("Name:")
            TextField("Enter Name ....", text: $name)
            Text("Password:")
            TextField("Enter Password ....", text: $password)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
