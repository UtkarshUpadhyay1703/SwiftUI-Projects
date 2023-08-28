//
//  ContentView.swift
//  Fetching data from APIs
//
//  Created by admin on 8/24/23.
//
import SwiftUI

struct Post: Codable {
    var index_name: String = "8d3b6596-b09e-4077-aebf-425193185a5b"
    var title: String = "Monthly Crude Oil Processed by Refineries"
    var desc: String = "Monthly Crude Oil Processed by Refineries"
    var created: Double = 1687434829260
    var updated: Double = 1687434890
    var created_date = "2023-06-22T17:24:31Z"
      var updated_date = "2023-06-22T17:24:50Z"
      var active = 1
      var visualizable = 1
      var catalog_uuid =  "ed4dbe82-439e-4e7f-b217-ce64627a49fc"
      var source = "data.gov.in"
      var org_type = "Central"
      var org:[String] = [
        "Ministry of Petroleum and Natural Gas",
        "Petroleum Planning & Analysis Cell (PPAC)"
      ]
    var sector: [String] = [
        "Non Renewable"
      ]
      var field = [
        {
          "name": "Month",
          "id": "month",
          "type": "keyword"
        },
        {
          "name": "Year",
          "id": "year",
          "type": "double"
        },
        {
          "name": "OIL COMPANIES",
          "id": "oil_companies_",
          "type": "keyword"
        },
        {
          "name": "Quantity (000 Metric Tonnes)",
          "id": "quantity_000_metric_tonnes_",
          "type": "double"
        },
        {
          "name": "last_updated",
          "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||dd/MM/yyyy",
          "id": "last_updated",
          "type": "date"
        }
      ],
      "target_bucket": {
        "index": "api",
        "type": "ed4dbe82-439e-4e7f-b217-ce64627a49fc",
        "field": "8d3b6596-b09e-4077-aebf-425193185a5b"
      },
      "message": "Resource lists",
      "version": "2.2.0",
      "status": "ok",
      "total": 1007,
      "count": 10,
      "limit": "10",
      "offset": "0",
      "records": [
        {
          "month": "July",
          "year": "2022",
          "oil_companies_": "BPCL-KOCHI, KERALA",
          "quantity_000_metric_tonnes_": "1423.65",
          "last_updated": "2023-08-24"
        },
        {
          "month": "July",
          "year": "2022",
          "oil_companies_": "HPCL-TOTAL",
          "quantity_000_metric_tonnes_": "2669.81",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "IOCL-KOYALI, GUJARAT",
          "quantity_000_metric_tonnes_": "1277.89",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "IOCL-HALDIA, WEST BENGAL",
          "quantity_000_metric_tonnes_": "708.57",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "IOCL-GUWAHATI,ASSAM",
          "quantity_000_metric_tonnes_": "91.19",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "IOCL-BONGAIGAON,ASSAM",
          "quantity_000_metric_tonnes_": "248.88",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "NRL-NUMALIGARH, ASSAM",
          "quantity_000_metric_tonnes_": "264.33",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "HMEL-GGSR, BATHINDA, PUNJAB",
          "quantity_000_metric_tonnes_": "1019.70",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "HPCL-TOTAL",
          "quantity_000_metric_tonnes_": "2342.38",
          "last_updated": "2023-08-24"
        },
        {
          "month": "August",
          "year": "2022",
          "oil_companies_": "RIL TOTAL",
          "quantity_000_metric_tonnes_": "5176.59",
          "last_updated": "2023-08-24"
        }
      ]
    }

    
}

struct ContentView: View {
    @State private var posts: [Post] = []

    var body: some View {
        NavigationView {
            List(posts, id: \.index_name) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.desc)
                        .font(.subheadline)
                }
            }
            .onAppear {
                fetchPosts()
            }
            .navigationTitle("Posts")
        }
    }

    func fetchPosts() {
        guard let url = URL(string: "https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedPosts
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
