//
//  Sign Up and in.swift
//  To-Do App
//
//  Created by admin on 8/8/23.
//
import SwiftUI

struct Sign_Up_and_in: View {
    // MARK: STATE PROPERTIES
    @FocusState private var fieldInFocus: OnboardingField?
    @AppStorage("name") private var name: String = ""
    @AppStorage("age") private var age: Double = 0
    @AppStorage("gender") private var gender: String = ""
    @AppStorage("sign-in") private var sign_in: Bool = false
    @State private var view: Int = 0
    let url = URL(string: "https://picsum.photos/300")
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .leading))
    
    //MARK: ENUM
    enum OnboardingField {
        case userName
        case userAge
        case userGender
    }
    
    //MARK: BODY
    var body: some View {
        ZStack{
            ZStack{
//                NavigationView{
                if(sign_in){
                    switch view {
                    case 0, 4:
                        profileView
                    default:
//                        NavigationLink("To-Do List", destination: {
                            ToDoView()
//                        })
                    }
                }else{
                    switch view{
                    case 0:
                        VStack{
                            welcomeUpper
                            welcomeMiddle
                            button
                        }
                        //                    .transition(transition)
                    case 1:
                        nameView
                        //                        .transition(transition)
                    case 2:
                        ageView
                        //                        .transition(transition)
                    case 3:
                        genderView
                        //                        .transition(transition)
                    default:
                        ToDoView()
                    }
                }
//            }
            }
            .frame(width: 500)
            .background(Color.pink.ignoresSafeArea())
        }
    }
}

struct Sign_Up_and_in_Previews: PreviewProvider {
    static var previews: some View {
        Sign_Up_and_in()
    }
}

//MARK: EXTENSION
extension Sign_Up_and_in{
    
    //MARK: FUNCTIONS: NAME SWITCH
    private func names() -> Text{
        if sign_in {
            return Text("PROFILE")
        }
        switch view {
        case 0:
            return Text("SIGN-UP")
        case 1:
            return Text("NAME")
        case 2:
            return Text("Age")
        case 3:
            return Text("Gender")
        default:
            return Text("Pappu")
        }
    }
    
    //MARK: IMAGE SWITCH
    private func images() -> Image{
        if sign_in {
            return Image(systemName: "person.fill")
        }else{
            switch view{
            case 0:
                return Image(systemName: "cloud.sun.fill")
            case 1:
                return Image(systemName: "wind")
            case 2:
                return Image(systemName: "pills.fill")
            case 3:
                return Image(systemName: "person.fill")
            default:
                return Image(systemName: "sun.fill")
            }
        }
    }
    
    //MARK: BUTTON NAME SWITCH
    private func buttonNames() -> Text {
        if sign_in {
            return Text("To-Do List")
        }else{
            switch view{
            case 0:
                return Text("Sign Up")
            case 1:
                return Text("Next")
            case 2:
                return Text("Next")
            case 3:
                return Text("Finish")
            default:
                return Text("Vese hi")
            }
        }
    }
    
    //MARK: WELCOME UPPER
    private var welcomeUpper: some View {
        VStack{
            names()
                .frame(height: 50)
                .font(.largeTitle.bold())
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            Spacer()
            //        images()
            //            AsyncImage(url: url)
            //            .resizable()
            AsyncImage(url: url, content: { image in
                image
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }, placeholder: {
                ProgressView()
            })
            Spacer()
        }
    }
    //MARK: MIDDLE: WELCOME
    private var welcomeMiddle:some View{
        VStack{
            Text("If not Signed-Up then please enter your details first.")
                .multilineTextAlignment(.center)
                .frame(width: 400, height: 150)
                .font(.largeTitle)
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            Spacer()
        }
    }
    //MARK: NAME
    private var nameMiddle: some View{
        VStack{
            Text("Enter your name")
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 100)
                .font(.largeTitle)
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            TextField("Start from here", text: $name)
                .focused($fieldInFocus, equals: .userName)
                .frame(width: 300, height: 50, alignment: .center)
                .background()
                .foregroundColor(.green)
                .border(.black)
                .cornerRadius(20)
            Spacer()
        }
        .onAppear(perform: {
            fieldInFocus = .userName
        })
    }
    
    //MARK: AGE
    private var ageMiddle: some View{
        VStack{
            Text("Enter your Age: \n \(String(format: "%.0f", age))")
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 100)
                .font(.largeTitle)
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            Slider(value: $age, in: 18...100)
            //                            .focused($fieldInFocus, equals: .userAge)
                .frame(width: 300, height: 50, alignment: .center)
                .background()
                .foregroundColor(.green)
                .border(.black)
                .cornerRadius(20)
            Spacer()
        }
        .onAppear(perform: {
            fieldInFocus = .userAge
        })
    }
    
    //MARK: GENDER
    private var genderMiddle: some View{
        VStack{
            Text("Select your Gender")
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 100)
                .font(.largeTitle)
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            Picker(selection: $gender, content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            }, label: {
                Text("Select a gender")
            })
                .pickerStyle(.segmented)
                .frame(width: 300, height: 50, alignment: .center)
                .background()
                .foregroundColor(.green)
                .border(.black)
                .cornerRadius(20)
            Spacer()
        }
        .onAppear(perform: {
            fieldInFocus = .userGender
        })
    }
    
    //MARK: PROFILE
    private var profileMiddle: some View{
        VStack{
            Text("Name : \(name) \n Age : \(String(format: "%.0f", age)) \n Gender : \(gender)")
                .multilineTextAlignment(.center)
                .frame(width: 400, height: 300)
                .font(.largeTitle)
                .border(.purple)
                .cornerRadius(20)
                .foregroundColor(.yellow)
                .background(.secondary)
                .padding(5)
            Spacer()
        }
    }
    //MARK: BUTTON
    private var button: some View {
        //        VStack{
        Button(action: {
            //On button click
            if sign_in {
//                name = ""
//                age = 0
//                gender = ""
//                sign_in = false
                view += 1
            }else{
                if(view < 3){
                    view += 1
                }else{
                    view += 1
                    sign_in = true
                }
            }
            
        }, label: {
            buttonNames()
                .frame(width: .infinity, height: 50)
                .font(.title.bold())
                .foregroundColor(.green)
        })
            .frame(width: 350, height: 50)
            .background(.orange)
            .border(.brown)
            .cornerRadius(30)
        //    }
    }
    
    //MARK: VIEWS
    private var nameView: some View{
        VStack{
            welcomeUpper
            Spacer()
            nameMiddle
            Spacer()
            button
        }
    }
    
    private var ageView: some View{
        VStack{
            welcomeUpper
            Spacer()
            ageMiddle
            Spacer()
            button
        }
    }
    
    private var genderView:some View{
        VStack{
            welcomeUpper
            Spacer()
            genderMiddle
            Spacer()
            button
        }
    }
    
    private var profileView:some View{
        VStack{
            welcomeUpper
            Spacer()
            profileMiddle
            Spacer()
            button
        }
    }
}
