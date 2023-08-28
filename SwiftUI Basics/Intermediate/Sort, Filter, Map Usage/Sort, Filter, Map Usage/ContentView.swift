//
//  ContentView.swift
//  Sort, Filter, Map Usage
//
//  Created by admin on 8/24/23.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mapArray: [String] = []
    
    init() {
        populateArray()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        /* MARK: Sort
        filteredArray = dataArray.sorted(by: { (user1, user2) -> Bool in
            return user1.points > user2.points
        })
        OR
        filteredArray = dataArray.sorted(by:{ $0.points > $1.points})
        */
        
        /* MARK: Filter
        filteredArray = dataArray.filter({ user in
            user.isVerified
        })
        OR
        filteredArray = dataArray.filter({ $0.isVerified })
         */
    
        /*MARK: Map
        mapArray = dataArray.map({ (user) -> String in
            return user.name
        })
        OR
        mapArray = dataArray.map({ $0.name })
         */
        
        //MARK: Compact Map
        //it is used when we have some nil in string and in this time mapArray will show error or use optionals OR Compact Map
//        mapArray = dataArray.compactMap({ $0.name })
        //OR
//        mapArray = dataArray.map({ $0.name ?? "ydf" })
        
        // All in one:
        mapArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
    }
    
    func populateArray() {
        let user1 = UserModel(name: "aa", points: 10, isVerified: true)
        let user2 = UserModel(name: "bb", points: 70, isVerified: false)
        let user3 = UserModel(name: nil, points: 80, isVerified: true)
        let user4 = UserModel(name: "dd", points: 50, isVerified: false)
        let user5 = UserModel(name: "ee", points: 100, isVerified: true)
        let user6 = UserModel(name: "ff", points: 90, isVerified: false)
        let user7 = UserModel(name: nil, points: 40, isVerified: true)
        let user8 = UserModel(name: "hh", points: 20, isVerified: false)
        let user9 = UserModel(name: "ii", points: 30, isVerified: true)
        let user10 = UserModel(name: "jj", points: 60, isVerified: true)
        dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}


struct ContentView: View {
    @StateObject var userModel = ArrayModificationViewModel()
    
    var body: some View {
        VStack(spacing:40){
            ScrollView{
                ForEach(userModel.mapArray, id: \.self){ name in
                    Text(name)
                        .font(.title2)
                        .padding()
                }
                
                //MARK: For Sort & Filter
//                ForEach(userModel.filteredArray){ user in
//                    VStack(alignment: .leading){
//                        Text(user.name.capitalized)
//                            .font(.headline)
//                        HStack{
//                            Text("Points = \(user.points)")
//                                .font(.headline)
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.blue)
//                    .cornerRadius(20)
//                    .padding()
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
