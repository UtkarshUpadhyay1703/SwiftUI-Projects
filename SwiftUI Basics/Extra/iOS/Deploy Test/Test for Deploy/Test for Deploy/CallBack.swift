//
//  CallBack.swift
//  Test for Deploy
//
//  Created by admin on 11/27/23.
//

import SwiftUI
import TabularData

struct CallBack: View {
    @State private var localVar = false
    var body: some View {
        Text("Value = \(String(localVar))")
            .onAppear {
                getData { gotValue in
                    if gotValue {
                        print("True - ")
                    }else{
                        print("False - ")
                    }
                }
            }
    }
    
//    let dataFetcher = getData { gotValue in
//        return gotValue
//    }
    
    func getData(completion: @escaping (Bool) -> Void){
        do {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("After 3 sec")
                localVar = true
                completion(localVar)
            }
            print("Got the data")
        }
    }
}

struct CallBack_Previews: PreviewProvider {
    static var previews: some View {
        CallBack()
    }
}
