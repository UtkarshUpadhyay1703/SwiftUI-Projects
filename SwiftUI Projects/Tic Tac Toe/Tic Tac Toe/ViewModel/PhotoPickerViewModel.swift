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
    
//    static var shared  = PhotoPickerViewModel()
    
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
    
    func setFirstImage() -> UIImage {
        getImageFromDirectory(isFirst: true)
        return firstProfileImage
    }
    
    func getImageFromDirectory(isFirst: Bool) {
        let url = imageUrl(isFirst: isFirst)
        if FileManager.default.fileExists(atPath: url.path ) {
            if isFirst {
                firstProfileImage = UIImage(contentsOfFile: url.path)!
            } else{
                secondProfileImage = UIImage(contentsOfFile: url.path)!
            }
        } else { print("No Image Found !!!!!") }
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
