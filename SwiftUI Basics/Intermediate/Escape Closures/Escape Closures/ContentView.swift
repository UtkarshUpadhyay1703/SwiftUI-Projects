//
//  ContentView.swift
//  Escape Closures
//
//  Created by admin on 9/4/23.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello Broos"
    
    func getData() {
//        text = downloadData()
        
        
//        downloadData2 { data in
//            text = data
//        }
        
        
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New Data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void){
        completionHandler("Very New Data")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            completionHandler("Asynchronous New Data")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            let result = DownloadResult(data: "New New Data")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping downloadCompletion){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            let result = DownloadResult(data: "Data New")
            completionHandler(result)
        }
    }
    
}

struct DownloadResult{
    var data: String
}

typealias downloadCompletion = (DownloadResult) -> ()

struct ContentView: View {
    @StateObject private var vm = EscapingViewModel()
    
    var body: some View {
        VStack{
            Text(vm.text)
                .onTapGesture {
                    vm.getData()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
