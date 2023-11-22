//
//  CombineViewModel.swift
//  Try API Call
//
//  Created by admin on 9/5/23.
//

import Foundation
import Combine

class DownloadWithCombineViewModel: ObservableObject{
    @Published var petrol: Petrol?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd0000011995738ed05d43c352c9b7f837672c1b&format=json") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
        //            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handelOutput(output:))
            .decode(type: Petrol.self, decoder: JSONDecoder())
//            .replaceError(with: []) if we have error instead of throwing error it will give dummy array if petrol is an array
            .sink { (completion) in
                switch completion{
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Finished!!!!!")
                }
            } receiveValue: { [weak self] (returnedPosts) in
                self?.petrol = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handelOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        print(output.data)
        return output.data
    }
}
