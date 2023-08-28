//
//  AutomaticGrammarAgreement.swift
//  Localization Usage
//
//  Created by admin on 8/22/23.
//

import SwiftUI

struct AutomaticGrammarAgreement: View {
    @State private var count: Int = 1
    
    func printText() -> AttributedString {
        var string = AttributedString(localized: "They liked your post.")
        // The user who liked the post uses feminine pronouns.
        var morphology = Morphology()
        morphology.grammaticalGender = .feminine
        string.inflect = InflectionRule(morphology: morphology)
        let result = string.inflected()
        // result == "She liked your post."
        print(result)
        return result
    }
    
    var body: some View {
        VStack{
            HStack{
            Button(action: {
                count += 1
            }, label: {
                Text("Increment")
            })
                .padding()
                .border(.brown, width: 5)
                .foregroundColor(.yellow)
                .background(.purple)
                .font(.title.bold())
            Spacer()
                Button(action: {
                    count -= 1
                }, label: {
                    Text("Decrement")
                })
                    .padding()
                    .border(.brown, width: 5)
                    .foregroundColor(.yellow)
                    .background(.purple)
                    .font(.title.bold())
            }
            .padding()
            
            Text("^[\(count) Person](inflect: true)")
            
            Text("^[\(count) Child](inflect: true)")
            
            Text("^[\(count) Person](inflect: true) ^[\(count) Child](inflect: true)")
            
            Text(printText())
        }
        .padding()
        .font(.title)
    }
}

struct AutomaticGrammarAgreement_Previews: PreviewProvider {
    static var previews: some View {
        AutomaticGrammarAgreement()
    }
}
