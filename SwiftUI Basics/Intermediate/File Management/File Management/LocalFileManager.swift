//
//  LocalFileManager.swift
//  File Management
//
//  Created by admin on 9/6/23.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() -> String {
        guard let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
                    return ""
                }
        
        if !FileManager.default.fileExists(atPath: path){
            do{
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Successfully created Folder")
                return "Successfully created Folder"
            } catch let error {
                print("Error Creating folder \(error)")
                return "Error Creating folder"
            }
        }
        return ""
    }
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
                    print("Error getting Path")
                    return nil
                }
        return path
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
        let path = getPathForImage(name: name)
        else {
                print("Error getting data")
                return ""
            }
        //        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        //        let tempDirectory =  FileManager.default.temporaryDirectory
        
        //        let path = cacheDirectory?.appendingPathComponent("\(name).jpg")
        
        do {
            try data.write(to: path)
            return "Saved Successfully!!!!!"
        } catch let error {
            print("Error in saving. \(error)")
            return "Error in saving."
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
                  print("Error: getting path.")
                  return nil
              }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
                  return "Error getting path"
              }
        do{
            try FileManager.default.removeItem(atPath: path)
            return "Deleted Successfully"
        } catch let error {
            return "Error deleting image \(error)"
        }
        
    }
    
    func deleteFolder() -> String {
        guard let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path
        else {
            return ""
        }
        do{
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted folder"
        } catch let error {
            print("Error Deleting Folder \(error)")
            return "Error in Deleting Folder"
        }
    }
    
    
}
