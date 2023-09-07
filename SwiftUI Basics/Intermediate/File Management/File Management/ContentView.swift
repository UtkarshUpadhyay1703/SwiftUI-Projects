//
//  ContentView.swift
//  File Management
//
//  Created by admin on 9/6/23.


import SwiftUI

struct ContentView: View {
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 180)
                        .cornerRadius(20)
                }
                
                HStack{
                    Button(action: {
                        vm.saveImage()
                    }, label: {
                        Text("Save to File")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete from File")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .cornerRadius(10)
                    })
                }
                
                HStack{
                    Button(action: {
                        vm.createFolder()
                    }, label: {
                        Text("Create Folder")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        vm.deleteFolder()
                    }, label: {
                        Text("Delete Folder")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .cornerRadius(10)
                    })
                }
                Text(vm.printText)
                    .font(.headline)
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
