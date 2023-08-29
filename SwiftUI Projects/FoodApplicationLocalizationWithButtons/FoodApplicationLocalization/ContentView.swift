//
//  ContentView.swift
//  FoodApplicationLocalization
//
//  Created by admin on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLanguage: String = ""
    @State private var languageVar: String = "en"
    @State private var stateName: String = "Arunachal Pradesh"
    @State private var Dish1: String = "Dish1"
    @State private var Dish2: String = "Dish2"
    @State private var Dish3: String = "Dish3"
    @State private var Dish4: String = "Dish4"
    @State private var Dish5: String = "Dish5"
    
    @State private var show1: Bool = false
    @State private var show2: Bool = false
    @State private var show3: Bool = false
    @State private var show4: Bool = false
    @State private var show5: Bool = false
        
    private var languages: [String] = ["English", "हिंदी(Hindi)", "मराठी(Marathi)", "தமிழ்(Tamil)", "ਪੰਜਾਬੀ(Punjabi)"]
    
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Select Your Language")
                HStack{
                    Picker(selection: $selectedLanguage, content: {
                        ForEach(languages.indices){ index in
                            Text(languages[index])
                                .foregroundColor(.red)
                                .tag(languages[index])
                        }
                    }, label: {
                        Text("Select Your Language")
                    })
                        .pickerStyle(.segmented)
                        .onAppear(perform: {
                            selectedLanguage = "English"
                        })
                        .onChange(of: selectedLanguage) { newValue in
                            print("new value = \(newValue)")
                            
                            switch newValue {
                            case "हिंदी(Hindi)":
                                stateName = "State".localizableString(loc: "hi") + "State English".localizableString(loc: "hi")
                                languageVar = "hi"
                                
                            case "मराठी(Marathi)":
                                stateName = "State".localizableString(loc: "mr") + "State English".localizableString(loc: "mr")
                                languageVar = "mr"
                                
                            case "தமிழ்(Tamil)":
                                stateName = "State".localizableString(loc: "ta") + "State English".localizableString(loc: "ta")
                                languageVar = "ta"
                                
                            case "ਪੰਜਾਬੀ(Punjabi)":
                                stateName = "State".localizableString(loc: "pa") + "State English".localizableString(loc: "pa")
                                languageVar = "pa"
                                
                            default :
                                stateName = "State".localizableString(loc: "en")
                                languageVar = "en"
                            }
                            Dish1 = "Dish1".localizableString(loc: languageVar)
                            Dish2 = "Dish2".localizableString(loc: languageVar)
                            Dish3 = "Dish3".localizableString(loc: languageVar)
                            Dish4 = "Dish4".localizableString(loc: languageVar)
                            Dish5 = "Dish5".localizableString(loc: languageVar)
                        }
                }
                
                Spacer()
                
                VStack{
                    NavigationLink(destination: {
                        Text(Dish1)
                        
                    }, label: {
                        ZStack{
                            Image(Dish1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                .onTapGesture(perform: {
                                    show1 = true
                                })
                            if show1{
                                VStack{
                                    Button(action: {
                                        show1 = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .frame(width: 10, height: 10, alignment: .topTrailing)
                                    .foregroundColor(.red)
                                    
                                    Image(Dish1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text(Dish1)
                            .font(.title.bold())
                    })
                        .padding()

                    NavigationLink(destination: {
                        Text(Dish2)
                    }, label: {
                        ZStack{
                            Image(Dish2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                .onTapGesture(perform: {
                                    show2 = true
                                })
                            if show2{
                                VStack{
                                    Button(action: {
                                        show2 = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .frame(width: 10, height: 10, alignment: .topTrailing)
                                    .foregroundColor(.red)
                                    
                                    Image(Dish2)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text(Dish2)
                            .font(.title.bold())
                    })
                        .padding()
                  
                    NavigationLink(destination: {
                        Text(Dish3)
                    }, label: {
                        ZStack{
                            Image(Dish3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                .onTapGesture(perform: {
                                    show3 = true
                                })
                            if show3{
                                VStack{
                                    Button(action: {
                                        show3 = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .frame(width: 10, height: 10, alignment: .topTrailing)
                                    .foregroundColor(.red)
                                    
                                    Image(Dish3)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text(Dish3)
                            .font(.title.bold())
                    })
                        .padding()
                    
                    NavigationLink(destination: {
                        Text(Dish4)
                    }, label: {
                        ZStack{
                            Image(Dish4)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                .onTapGesture(perform: {
                                    show4 = true
                                })
                            if show4{
                                VStack{
                                    Button(action: {
                                        show4 = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .frame(width: 10, height: 10, alignment: .topTrailing)
                                    .foregroundColor(.red)
                                    
                                    Image(Dish4)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text(Dish4)
                            .font(.title.bold())
                    })
                        .padding()
                   
                    NavigationLink(destination: {
                        Text(Dish5)
                    }, label: {
                        ZStack{
                            Image(Dish5)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                .onTapGesture(perform: {
                                    show5 = true
                                })
                            if show5{
                                VStack{
                                    Button(action: {
                                        show5 = false
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .frame(width: 10, height: 10, alignment: .topTrailing)
                                    .foregroundColor(.red)
                                    
                                    Image(Dish5)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text(Dish5)
                            .font(.title.bold())
                    })
                        .padding()
                }
            }
            .navigationTitle(stateName)
            .background(Image(selectedLanguage))
        }.navigationViewStyle(.stack)
        
    }
}

extension String{
    func localizableString(loc: String) -> String {
        var locNew: String = ""
        if loc == "pa" || loc == "ta" || loc == "mr" {
            locNew = loc + "-IN"
        } else {
            locNew = loc
        }
        let path = Bundle.main.path(forResource: locNew, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
