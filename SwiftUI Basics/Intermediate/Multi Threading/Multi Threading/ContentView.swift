//
//  ContentView.swift
//  Multi Threading
//
//  Created by admin on 8/31/23.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject{
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let data = self.downloadData()
            print("Is main thread = \(Thread.isMainThread)")
            print("Thread = \(Thread.current)")
            DispatchQueue.main.async {
                self.dataArray = data
                print("Is main thread \(Thread.isMainThread)")
                print("Thread = \(Thread.current)")
            }
        }
    }
    
    func downloadData() -> [String] {
        var data: [String] = []
        for index in 0..<100 {
            data.append("\(index)")
            print(data)
        }
        return data
    }
}

struct ContentView: View {
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView{
        LazyVStack(spacing: 10){
            Text("Load Data")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .onTapGesture {
                    vm.fetchData()
                }
            ForEach(vm.dataArray, id: \.self) { item in
                Text(item)
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
