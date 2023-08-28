//
//  ViewModel.swift
//  SwiftUIAPICall
//
//  Created by admin on 8/25/23.
//

import Foundation
import SwiftUI

struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php")else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil
            else {
                return
            }
            /*
             Inside the closure, guard let data = data, error == nil else { ... } checks whether the data was successfully received and if there are no errors. If either condition is not met, the closure returns early.
             */
                       
//            MARK: Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
        //to initiate the network to take the data and from url OR triggers the network request.
    }
}
