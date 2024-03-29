//
//  PhotoPickerViewModel.swift
//  Tic Tac Toe
//
//  Created by admin on 10/11/23.
//
import Foundation
import SwiftUI

class PhotoPickerViewModel: ObservableObject{
    @Published var firstProfileImage: UIImage = UIImage()
    @Published var secondProfileImage: UIImage = UIImage()
    
    func imageUrl(isFirst: Bool) -> URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print("File Path: \(documents)")
        return isFirst ? documents.appendingPathComponent("firstProfileImage.jpg") : documents.appendingPathComponent("secondProfileImage.jpg")
    }
    
    func saveImageToDirectory(image: UIImage, isFirst: Bool) {
        if let data = image.jpegData(compressionQuality: 1.0){
            do {
                try data.write(to: imageUrl(isFirst: isFirst))
            } catch {
                print("Error in saving image to Directory")
            }
        }
    }
    
    func setProfileImage(isFirst: Bool) -> UIImage {
        isFirst ? getImageFromDirectory(isFirst: true) : getImageFromDirectory(isFirst: false)
        return isFirst ? firstProfileImage : secondProfileImage
    }
    
    func isFileExistAtPath(url: URL) -> Bool {
        if FileManager.default.fileExists(atPath: url.path){
            print("File Exist at this path")
            return true
        }else{
            print("File does not exist at this path")
            return false
        }
    }
    
    func getImageFromDirectory(isFirst: Bool) {
        let url = imageUrl(isFirst: isFirst)
        if isFileExistAtPath(url: url) {
            if isFirst {
                firstProfileImage = UIImage(contentsOfFile: url.path)!
            } else{
                secondProfileImage = UIImage(contentsOfFile: url.path)!
            }
        }
    }
    
    func deleteImage(url: URL){
        do {
            try FileManager.default.removeItem(atPath: url.path)
        } catch {
            print("Error in Deleting Image: ",error)
        }
    }
    
    func deleteImageFromDirectory(isFirst: Bool) {
        let url = imageUrl(isFirst: isFirst)
        deleteImage(url: url)
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Environment(\.dismiss) private var dismiss
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerView
        
        init(_ parent: ImagePickerView){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.selectedImage = image
            }
            parent.dismiss()
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
