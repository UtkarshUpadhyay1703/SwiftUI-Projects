//
//  TestTabularData.swift
//  Test for Deploy
//
//  Created by admin on 11/24/23.
//

import SwiftUI
import TabularData
import Alamofire
import SwiftyJSON

let url = "https://jsonplaceholder.typicode.com/posts"


extension DataFrame.Rows : RandomAccessCollection {}

struct TestTabularData: View {
    @State private var dataTable: DataFrame?
    
//    var data
    init(){
        getData()
    }
    var body: some View {
        VStack {
            if let dataTable = dataTable {
                List(dataTable.rows, id: \.index) { row in
                    HStack {
                        Text(String(row["id"] as! Int))
                        Text(String(row["userId"] as! Int))
                        Text(row["title"] as! String)
                        Text(row["body"] as! String)
                    }
                }
            } else {
                Text("Data is not available") // Display a placeholder text if dataTable is nil
            }
        }
        .onAppear {
                    getData()
                }
    }
    
    func getData() {
        guard let fileURL = URL(string: url) else {
            print("Invalid URL")
            return
        }

        do {
            dataTable = try DataFrame(contentsOfJSONFile: fileURL)
            print("Got the data")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

}

struct TestTabularData_Previews: PreviewProvider {
    static var previews: some View {
        TestTabularData()
    }
}
