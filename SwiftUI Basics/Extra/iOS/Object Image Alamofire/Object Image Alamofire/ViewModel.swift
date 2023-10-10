//
//  ViewModel.swift
//  Object Image Alamofire
//
//  Created by admin on 9/1/23.
//

//import Foundation
//import Alamofire
//
//class ViewModel: ObservableObject {
//    @Published private(set) var data: [Model] = []
//
//    init() {
//        fetchData()
//    }
//
//    func fetchData() {
//        AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
//            switch response.result {
//            case .success(let responseData) :
//                if let data = responseData as? Data {
//                    do{
//                        let dataModels = try JSONDecoder().decode([Model].self, from: data)
//                        DispatchQueue.main.async {
//                            self.data = dataModels
//                        }
//                    } catch {
//                        print("Error Decoding Data = \(error)")
//                    }
//                }
//                else{
//                    print("Response data is not of type Data")
//                }
//
//            case .failure(let error):
//                print("Network request failed with error : \(error)")
//            }
//        }
//    }
//}



import Foundation
import Alamofire
import UIKit

class ViewModel: ObservableObject {
    @Published private(set) var data: [Model] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
            switch response.result {
            case .success(let responseData):
                if let jsonArray = responseData as? [[String: Any]] {
                    // Successfully received JSON data as an array of dictionaries
                    do {
                        let dataModels = try JSONDecoder().decode([Model].self, from: JSONSerialization.data(withJSONObject: jsonArray))
                        DispatchQueue.main.async {
                            self.data = dataModels
                        }
                    } catch {
                        print("Error Decoding Data = \(error)")
                    }
                } else {
                    print("Response data is not a JSON array")
                }
                
            case .failure(let error):
                print("Network request failed with error: \(error)")
            }
        }
    }
}
