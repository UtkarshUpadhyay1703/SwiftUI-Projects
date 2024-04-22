//
//  ContentView.swift
//  Test for Deploy
//
//  Created by admin on 11/23/23.
//

import SwiftUI
import TabularData

let deaths_path = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

struct ContentView: View {
    var body: some View {
        VStack{
        Text("Hello")
    }
        .onAppear {
            guard let fileURL = URL(string: deaths_path) else {
                fatalError("Error creating URL")
            }
            let columnNames = ["Country/Region",

                               "4/30/22"]


            let columnTypes: [String : CSVType] = ["Country/Region": .string,

                                                   "4/30/22": .integer]


            let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")

            let covidDeathsDf =  try! DataFrame(

                contentsOfCSVFile: fileURL,

                columns: columnNames,

                types: columnTypes,

                options: options)


            var countryTotals = covidDeathsDf

                .grouped(by: "Country/Region")

                .sums("4/30/22", Int.self, order: .descending)


            countryTotals.renameColumn("Country/Region", to: "Country")

            countryTotals.renameColumn("sum(4/30/22)", to: "Total Deaths")


            let formatingOptions = FormattingOptions(maximumLineWidth: 100, includesColumnTypes: false)

            print("\(countryTotals.prefix(20).description(options: formatingOptions))")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
