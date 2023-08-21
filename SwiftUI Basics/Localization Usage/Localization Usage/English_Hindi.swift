//
//  English_Hindi.swift
//  Localization Usage
//
//  Created by admin on 8/21/23.
//

import SwiftUI

struct English_Hindi: View {
    @State var variable1: String = "what_is_your_plan"
    @State var variable2: String = "your age is ="
    var age = "55"
    @State var count = 1
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    variable1 = "what_is_your_plan".localizableString(loc: "en")
                    variable2 = "your age is".localizableString(loc: "en")
                }, label: {
                    Text("English")
                })
                    .padding()
                    .border(.brown, width: 5)
                    .foregroundColor(.yellow)
                    .background(.purple)
                    .font(.title.bold())
                Button(action: {
                    variable1 = variable1.localizableString(loc: "hi")
                    variable2 = "your age is".localizableString(loc: "hi")
                }, label: {
                    Text("हिंदी")
                })
                    .padding()
                    .border(.brown, width: 5)
                    .foregroundColor(.yellow)
                    .background(.purple)
                    .font(.title.bold())
            }
            
            
            Text(variable1)
            //OR
            //            Text(String(localized: "what_is_your_plan"))
            Text("\(variable2) \(age)")
            Text("\(count) is Plural")
        }
        .font(.title)
        .padding()
        .border(.brown, width: 10)
    }
}

extension String{
    func localizableString(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        //        print(Bundle.preferredLocalizations(from: allServerLanguages).first)
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

struct English_Hindi_Previews: PreviewProvider {
    static var previews: some View {
        English_Hindi()
            .environment(\.locale, Locale.init(identifier: "en"))
    }
}
