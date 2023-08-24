//
//  ContentView.swift
//  FoodApplicationLocalization
//
//  Created by admin on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    //    @State private var selectedState: String = "Arunachal Pradesh"
    @State private var selectedLanguage: String = "English"
    @State private var Dish1: String = "Dish1"
    @State private var Dish2: String = "Dish2"
    @State private var Dish3: String = "Dish3"
    @State private var Dish4: String = "Dish4"
    @State private var Dish5: String = "Dish5"
    
    //    private var stateNames: [String] = [ "Arunachal Pradesh", "Uttar Pradesh", "Maharashtra", "Tamil Nadu", "Punjab"]
    
    private var languages: [String] = ["English", "Hindi", "Marathi", "Tamil", "Punjabi"]
    
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Select Your Language")
                HStack{
                    Picker(selection: $selectedLanguage, content: {
                        //                        ForEach(languages, id: \.self){ language in
                        //                            Text(language)
                        //                                .foregroundColor(.red)
                        //                                .tag(<#T##tag: Hashable##Hashable#>)
                        //                        }
                        ForEach(languages.indices){ index in
                            Text(languages[index])
                                .foregroundColor(.red)
                                .tag(languages[index])
                            
                        }
                    }, label: {
                        Text("Select Your Language")
                    })
                        .pickerStyle(.segmented)
                        .onChange(of: selectedLanguage) { newValue in
                            if newValue == "English" {
                                Dish1 = "Dish1".localizableString(loc: "en")
                                Dish2 = "Dish2".localizableString(loc: "en")
                                Dish3 = "Dish3".localizableString(loc: "en")
                                Dish4 = "Dish4".localizableString(loc: "en")
                                Dish5 = "Dish5".localizableString(loc: "en")
                            }
                        }
                }
                
                Spacer()
                
                VStack{
                    //                    ForEach(0..<5){ index in
                    
                    NavigationLink(destination: {
                        Text(Dish1)
                    }, label: {
                        Image(Dish1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(100)
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        Text(Dish1)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    
                    NavigationLink(destination: {
                        Text(dish2)
                    }, label: {
                        Image(dish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(100)
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        Text(dish2)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    
                    NavigationLink(destination: {
                        Text(dish3)
                    }, label: {
                        Image(dish3)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(100)
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        Text(dish3)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    NavigationLink(destination: {
                        Text(dish4)
                    }, label: {
                        Image(dish4)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(100)
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        Text(dish4)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    
                    NavigationLink(destination: {
                        Text(dish5)
                    }, label: {
                        Image(dish5)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(100)
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        Text(dish5)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    
                    //                    }
                }
            }
            .navigationTitle(Text("State"))
            .background(Image(selectedLanguage))
        }.navigationViewStyle(.stack)
        
    }
}

extension ContentView {
    var dish1: String {
        return NSLocalizedString("Dish1", comment: "Finding first dish from localization")
    }
    var dish2: String {
        return NSLocalizedString("Dish2", comment: "Finding second dish from localization")
    }
    var dish3: String {
        return NSLocalizedString("Dish3", comment: "Finding third dish from localization")
    }
    var dish4: String {
        return NSLocalizedString("Dish4", comment: "Finding fourth dish from localization")
    }
    var dish5: String {
        return NSLocalizedString("Dish5", comment: "Finding fifth dish from localization")
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .environment(\.locale, .init(identifier: "en"))
            ContentView()
                .environment(\.locale, .init(identifier: "hi"))
        }
    }
}
