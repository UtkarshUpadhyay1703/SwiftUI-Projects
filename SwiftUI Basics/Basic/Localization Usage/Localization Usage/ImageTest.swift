//
//  ImageTest.swift
//  Localization Usage
//
//  Created by admin on 8/23/23.
//

import SwiftUI

struct ImageTest: View {
    @Environment(\.locale) var locale
    
    var imageNameOnLanguageBasis: String {
        //For restricting country wise Application
        //        if locale.regionCode == "IN" {
        //            print("Terminate")
        //            exit(0)
        //        }
        return NSLocalizedString("Flag", comment: "")
    }
    
    var imageNameOnRegionBasis: String {
        let regionCode = locale.regionCode
        print("Region Code = \(regionCode!)")
        return "\(regionCode!)/Food"
    }
    
    @State private var flag: String = "Flag"
    var body: some View {
        VStack{
            Text("Your Flag")
            Image(imageNameOnLanguageBasis)
                .resizable()
                .scaledToFit()
            
            Image(imageNameOnRegionBasis)
                .resizable()
                .scaledToFit()
        }
    }
}

struct ImageTest_Previews: PreviewProvider {
    static var previews: some View {
        ImageTest()
    }
}
