//
//  ContentView.swift
//  CodeScanningTest
//
//  Created by Admin on 10/16/23.
//

import SwiftUI
import CodeScanner
import UIKit
struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to start."
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    
                    // Open the scanned link in the browser (for iOS)
                    if let url = URL(string: self.scannedCode) {
                    UIApplication.shared.open(url)
                                       }
                    
                }
                
            }
        
        )
    }
    
    
    var body: some View {
        VStack(spacing: 10){
            Text(scannedCode)
            Button("Scan QR Code"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
