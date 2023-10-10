//
//  ViewModel.swift
//  Fetching Data
//
//  Created by admin on 10/9/23.
//

import Foundation
// Model Struct should necessarily confirm to Decodable protocol Because: The URL data came from online servers should decode in this model
//Model Struct should necessarily confirm to Hashable protocol Because: in ContentView we are applying ForEach to the array of fakeDataModel so we can use \.self that's why we apply Hashable.
struct FakeDataModel: Codable, Hashable, Identifiable{
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
}

// This class should necessarily confirm to ObservableObject protocol Because: We are creating @StateObject of ViewModel in ContentView.
class ViewModel: ObservableObject {
    @Published var fakeData: [FakeDataModel] = []
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil
            else { return }
            do {
                let fakeData = try JSONDecoder().decode([FakeDataModel].self, from: data)
                print("Fetched Data: \(fakeData)")
                DispatchQueue.main.async {
                    self?.fakeData = fakeData
                }
            } catch {
                print("Error in fetching Data :", error)
            }
        }
        task.resume()
    }
}
