//
//  ContentView.swift
//  Try API Call
//
//  Created by admin on 8/29/23.
//

import SwiftUI
//import DGCharts
//import Charts

struct ContentView: View {
//    @ObservedObject var viewModel = HomeViewModel()
    @StateObject var viewModel = DownloadWithCombineViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                if let title = viewModel.petrol?.title {
                    Text(title)
                        .font(.title.bold())
                    
                } else {
                    Text("Title not available")
                }
                
                if let records = viewModel.petrol?.records{
                    ForEach( 0 ..< records.count ){ index in
                        Text("Month = \(records[index].month?.rawValue ?? "No Month")")
                        Text("Year = \(records[index].year ?? "No Year")")
                        Text("Company = \(records[index].oilCompanies ?? "No Company")")
                        Text("Quantity = \(records[index].quantity000_MetricTonnes ?? "No Quantity")")
                        Divider()
                    }
                    
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
