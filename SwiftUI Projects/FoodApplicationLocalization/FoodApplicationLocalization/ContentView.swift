//
//  ContentView.swift
//  FoodApplicationLocalization
//
//  Created by admin on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    //    @State private var selectedState: String = "Arunachal Pradesh"
    
    @State private var selectedLanguage: String = ""
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
    
    //    private var stateNames: [String] = [ "Arunachal Pradesh", "Uttar Pradesh", "Maharashtra", "Tamil Nadu", "Punjab"]
    //    func lang() -> String {
    //        let code = locale.languageCode
    //        return code
    //    }
    
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
                                Dish1 = "Dish1".localizableString(loc: "hi")
                                Dish2 = "Dish2".localizableString(loc: "hi")
                                Dish3 = "Dish3".localizableString(loc: "hi")
                                Dish4 = "Dish4".localizableString(loc: "hi")
                                Dish5 = "Dish5".localizableString(loc: "hi")
                                
                            case "मराठी(Marathi)":
                                stateName = "State".localizableString(loc: "mr") + "State English".localizableString(loc: "mr")
                                Dish1 = "Dish1".localizableString(loc: "mr")
                                Dish2 = "Dish2".localizableString(loc: "mr")
                                Dish3 = "Dish3".localizableString(loc: "mr")
                                Dish4 = "Dish4".localizableString(loc: "mr")
                                Dish5 = "Dish5".localizableString(loc: "mr")
                                
                            case "தமிழ்(Tamil)":
                                stateName = "State".localizableString(loc: "ta") + "State English".localizableString(loc: "ta")
                                Dish1 = "Dish1".localizableString(loc: "ta")
                                Dish2 = "Dish2".localizableString(loc: "ta")
                                Dish3 = "Dish3".localizableString(loc: "ta")
                                Dish4 = "Dish4".localizableString(loc: "ta")
                                Dish5 = "Dish5".localizableString(loc: "ta")
                                
                            case "ਪੰਜਾਬੀ(Punjabi)":
                                stateName = "State".localizableString(loc: "pa") + "State English".localizableString(loc: "pa")
                                Dish1 = "Dish1".localizableString(loc: "pa")
                                Dish2 = "Dish2".localizableString(loc: "pa")
                                Dish3 = "Dish3".localizableString(loc: "pa")
                                Dish4 = "Dish4".localizableString(loc: "pa")
                                Dish5 = "Dish5".localizableString(loc: "pa")
                                
                            default :
                                stateName = "State".localizableString(loc: "en")
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
                    
                    
                    //                    }
                }
            }
            .navigationTitle(stateName)
            //            .navigationTitle("State English")
            .background(Image(selectedLanguage))
        }.navigationViewStyle(.stack)
        
    }
}

//extension ContentView {
//    var dish1: String {
//        return NSLocalizedString("Dish1", comment: "Finding first dish from localization")
//    }
//    var dish2: String {
//        return NSLocalizedString("Dish2", comment: "Finding second dish from localization")
//    }
//    var dish3: String {
//        return NSLocalizedString("Dish3", comment: "Finding third dish from localization")
//    }
//    var dish4: String {
//        return NSLocalizedString("Dish4", comment: "Finding fourth dish from localization")
//    }
//    var dish5: String {
//        return NSLocalizedString("Dish5", comment: "Finding fifth dish from localization")
//    }
//}

extension String{
    func localizableString(loc: String) -> String {
        var locNew: String = ""
        if loc == "pa" || loc == "ta" || loc == "mr" {
            locNew = loc + "-IN"
        } else {
            locNew = loc
        }
        let path = Bundle.main.path(forResource: locNew, ofType: "lproj")
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
            //            ContentView()
            //                .environment(\.locale, .init(identifier: "hi"))
        }
    }
}
