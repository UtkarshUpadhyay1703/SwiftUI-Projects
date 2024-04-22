//
//  File.swift
//  QRCodeScannerIOS
//
//  Created by admin on 12/4/23.
//


import SwiftUI
import AVKit

class QRScannerDelegate: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate{
    @Published var scannedCode: String?
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        if let metaObject = metadataObjects.first{
            guard let readableObject = metaObject as? AVMetadataMachineReadableCodeObject else {return}
            guard let scannedCode = readableObject.stringValue else {return}
            let encodeUrlString = scannedCode.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if let encodedString = encodeUrlString{
                if let url = URL(string: encodedString) {
                    UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
                        print("here")
                    })
                }else{
                    print("else")
                    print(scannedCode)
                }
            }
        }
    }
}
