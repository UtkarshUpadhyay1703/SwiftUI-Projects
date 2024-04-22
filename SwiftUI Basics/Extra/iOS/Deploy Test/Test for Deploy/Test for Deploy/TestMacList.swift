//
//  TestMacList.swift
//  Test for Deploy
//
//  Created by admin on 12/4/23.
//

import SwiftUI
import Alamofire
import SwiftyJSON

let deployURL = "http://192.168.10.110"

struct TestMacList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                fetchAllMacs()
//                fetchSites()
            }
    }
    
    func fetchAllMacs() {
        let param: [String : String]
        let loginURL = deployURL + "/Account/SignIn"
        
            param = [
                "EmailAddress" : "utkarashu@alohatechnologydev.com",
                "Password" : "Aloha@123",
                "LoginWith" : "Email"
            ]
        AF.request(loginURL, method: .post, parameters: param, encoder: .json).responseData{
                    response in
                    switch response.result {
                    case .success(let data):
                        print(String(data: data , encoding: .utf8) ?? "Invalid UTF-8 Data")
                        
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
    }
       
    
    
}


// MARK: - SiteList
struct SiteList: Codable {
    let lstSites: [ListSite]
}

// MARK: - ListSite
struct ListSite: Codable, Hashable {
    let siteKey, siteName: String
    let siteID: Int
    let schemaName: String
    
    enum CodingKeys: String, CodingKey {
        case siteKey = "SiteKey"
        case siteName = "SiteName"
        case siteID = "SiteId"
        case schemaName = "SchemaName"
    }
}

struct TestMacList_Previews: PreviewProvider {
    static var previews: some View {
        TestMacList()
    }
}
