//
//  HomeViewModel.swift
//  Try API Call
//
//  Created by admin on 8/29/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var record = [Record]()
//    @Published var petrol: Petrol? = nil
    @Published var petrol = Petrol(from: <#Decoder#>)
    
    init(){
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.data.gov.in/resource/518e560e-7fa7-4f5b-8aed-3b90323ed965?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response Code \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            print("DEBUG: Data \(dataAsString ?? "pata nahi")")
            
            do{
                let record = try JSONDecoder().decode(petrol.self, from: data)
//                print("DEBUG: Coins \(record)")
                DispatchQueue.main.async {
                    self.record = record
//                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("Failed to decode with error: \(error)")
            }
        }
        .resume()
    }
    
//    func configureTopMovingCoins() {
//        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
//        self.topMovingCoins = Array(topMovers.prefix(5))
//    }
}
