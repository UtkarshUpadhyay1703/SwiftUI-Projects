//
//  ContentView.swift
//  FoodAppNormal
//
//  Created by admin on 8/28/23.
//
import SwiftUI

struct ContentView: View {
    @Environment(\.locale) var locale
    
    @State private var show1: Bool = false
    @State private var show2: Bool = false
    @State private var show3: Bool = false
    @State private var show4: Bool = false
    @State private var show5: Bool = false
        
    var body: some View {
        NavigationView{
            ScrollView{
                
                Spacer()
                
                VStack{
                    NavigationLink(destination: {
                        Text("Dish1")
                        
                    }, label: {
                        ZStack{
                            Image("Dish1".localizableString(loc: locale.languageCode!))
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
                                    
                                    Image("Dish1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text("Dish1")
                            .font(.title.bold())
                    })
                        .padding()

                    NavigationLink(destination: {
                        Text("Dish2")
                    }, label: {
                        ZStack{
                            Image("Dish2".localizableString(loc: locale.languageCode!))
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
                                    
                                    Image("Dish2".localizableString(loc: locale.languageCode!))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text("Dish2")
                            .font(.title.bold())
                    })
                        .padding()
                  
                    NavigationLink(destination: {
                        Text("Dish3")
                    }, label: {
                        ZStack{
                            Image("Dish3".localizableString(loc: locale.languageCode!))
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
                                    
                                    Image("Dish3".localizableString(loc: locale.languageCode!))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text("Dish3")
                            .font(.title.bold())
                    })
                        .padding()
                    
                    NavigationLink(destination: {
                        Text("Dish4")
                    }, label: {
                        ZStack{
                            Image("Dish4".localizableString(loc: locale.languageCode!))
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
                                    
                                    Image("Dish4".localizableString(loc: locale.languageCode!))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text("Dish4")
                            .font(.title.bold())
                    })
                        .padding()
                   
                    NavigationLink(destination: {
                        Text("Dish5")
                    }, label: {
                        ZStack{
                            Image("Dish5".localizableString(loc: locale.languageCode!))
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
                                    
                                    Image("Dish5".localizableString(loc: locale.languageCode!))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 550, height: 550)
                                        .cornerRadius(100)
                                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                                }
                            }
                        }
                        Text("Dish5")
                            .font(.title.bold())
                    })
                        .padding()
                }
            }
            .navigationTitle(stateName(loc: locale.languageCode!))
            .background(Image("State".localizableString(loc: locale.languageCode!))
                            .resizable()
                            .scaledToFit()
                            
            )
        }.navigationViewStyle(.stack)
        
    }
}

extension ContentView {
    func stateName(loc: String) -> String {
        let stateFull = "State".localizableString(loc: loc) + "State English".localizableString(loc: loc)
        return stateFull
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
            ContentView()
                .environment(\.locale, .init(identifier: "hi"))
            ContentView()
                .environment(\.locale, .init(identifier: "mr-IN"))
        }
    }
}

