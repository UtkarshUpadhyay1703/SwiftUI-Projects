//
//  ContentView.swift
//  PaiChartUsage
//
//  Created by admin on 10/9/23.
//

import SwiftUI
import SwiftPieChart

struct ContentView: View {
    var body: some View {
        VStack{
        PieChartView(
            values: [1300, 500, 300],
            names: ["Rent", "Transport", "Education"],
            formatter: {value in String(format: "$%.2f", value)})
//                .ignoresSafeArea()
            Spacer()
            PieChartView(
                values: [1300, 500, 300],
                names: ["Rent", "Transport", "Education"],
                formatter: {value in String(format: "$%.2f", value)},
                colors: [Color.red, Color.purple, Color.orange],
                backgroundColor: Color(red: 30 / 255, green: 54 / 255, blue: 14 / 255, opacity: 1.0))
        }
        .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
