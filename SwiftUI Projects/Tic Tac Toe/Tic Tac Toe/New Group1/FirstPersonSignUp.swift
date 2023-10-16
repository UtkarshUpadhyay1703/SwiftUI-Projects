//
//  FirstPersonSignUp.swift
//  Tic Tac Toe
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct FirstPersonSignUp: View {
    @AppStorage("firstPersonName") var firstPersonName: String = ""
    @StateObject private var photoViewModel = PhotoPickerViewModel()
    @State private var personImage = UIImage()
    @State private var imagePicker = false
    @State private var notMyDetails = false
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                VStack(alignment: .center){
                    Text("Profile Image:")
                        .font(.title)
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.indigo)
                    
                    Button {
                        imagePicker.toggle()
                    } label: {
                        VStack(alignment: .center){
                            Image(uiImage: personImage)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .edgesIgnoringSafeArea(.all)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle()
                                            .stroke(Color.gray, lineWidth: 7))
                            Text("Add Image")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    .onAppear {
                        if !notMyDetails{
                            photoViewModel.getImageFromDirectory(isFirst: true)
                            personImage = photoViewModel.firstProfileImage
                        }
                    }
                    .padding()
                    .border(.brown, width: 2)
                    .cornerRadius(10)
                    .sheet(isPresented: $imagePicker) {
                        ImagePickerView(selectedImage: $personImage)
                    }
                    
                    Text("Name:")
                        .font(.title)
                        .bold()
                        .frame(width: 100, height: 50)
                        .foregroundColor(.indigo)
                    TextField("Enter Name", text: $firstPersonName)
                        .font(.headline)
                        .frame(width: geometry.size.width - 50, height: 40)
                        .border(.brown, width: 5)
                        .background(.yellow)
                    
                    Spacer()
                    
                    if (personImage != UIImage()){
                        NavigationLink {
                            LandingPage()
                        } label: {
                            Text("Play")
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                        }
                        .onDisappear{
                            photoViewModel.saveImageToDirectory(image: personImage, isFirst: true)
                        }
                        .frame(width: 100, height: 40)
                        .background(.green)
                        .cornerRadius(10)
                    }
                    
                    Button {
                        notMyDetails = true
                        firstPersonName = ""
                        photoViewModel.deleteImageFromDirectory(isFirst: true)
                        personImage = UIImage()
                    } label: {
                        Text("Not My Details!!")
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(.red)
            .navigationTitle("First Person Details:")
        }
    }
}

struct FirstPersonSignUp_Previews: PreviewProvider {
    static var previews: some View {
        FirstPersonSignUp()
    }
}
