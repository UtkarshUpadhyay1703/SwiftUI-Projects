//
//  HomeViewModel.swift
//  Try API Call
//
//  Created by admin on 8/29/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var petrol: Petrol?
    
    init(){
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd0000011995738ed05d43c352c9b7f837672c1b&format=json"
        
        guard let url = URL(string: urlString) else { return }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newPost = try? JSONDecoder().decode(Petrol.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.petrol = newPost
                }
            }else {
                print("No data returned")
            }
        }
        
        func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard
                    let data = data,
                    error == nil,
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                        print("Error Downloading data !!!!!")
                        completionHandler(nil)
                        return
                    }
                completionHandler(data)
            }
            .resume()
        }
        
        //OR
        
        
        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //
        //            guard let data = data else {
        //                print("No data")
        //                return
        //            }
        //
        //            if let error = error {
        //                print("DEBUG: Error \(error.localizedDescription)")
        //                return
        //            }
        //
        //            if let response = response as? HTTPURLResponse {
        //                print("DEBUG: Response Code \(response.statusCode)")
        //            }
        //
        //            let dataAsString = String(data: data, encoding: .utf8)
        //            print("DEBUG: Data \(dataAsString ?? "pata nahi")")
        //
        //            do{
        //                let petrol = try JSONDecoder().decode(Petrol.self, from: data)
        //                print("DEBUG: Petrol = \(petrol)")
        //                DispatchQueue.main.async {
        //                    self.petrol = petrol
        //                }
        //            } catch let error {
        //                print("Failed to decode with error: \(error)")
        //            }
        //        }
        //        .resume()
    }
    
    //    func configureTopMovingCoins() {
    //        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
    //        self.topMovingCoins = Array(topMovers.prefix(5))
    //    }
}
