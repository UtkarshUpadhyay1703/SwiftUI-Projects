//
//  ViewModel.swift
//  File Management
//
//  Created by admin on 9/6/23.
//

import SwiftUI

class FileManagerViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    let imageName: String = "Vikram"
    let manager = LocalFileManager.instance
    @Published var printText:String = ""
    
    init(){
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func deleteImage() {
       printText =  manager.deleteImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        printText = manager.saveImage(image: image, name: imageName)
    }
    
    func createFolder() {
        printText = manager.createFolderIfNeeded()
    }
    
    func deleteFolder() {
        printText = manager.deleteFolder()
    }
}
