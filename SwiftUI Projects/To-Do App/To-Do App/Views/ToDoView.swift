//
//  ToDoView.swift
//  To-Do App
//
//  Created by admin on 8/8/23.
//
import SwiftUI

struct ToDoView: View {
    // For Full List
    @AppStorage("arr") var fullListData: Data = Data()
    //For adding new work to To-Do List
    @State var toDoString: String = ""
    @AppStorage("name") private var name: String = ""
    @AppStorage("age") private var age: Double = 0
    @AppStorage("gender") private var gender: String = ""
    @AppStorage("sign-in") private var sign_in: Bool = true
    // For Edit we are using new this state
    @State var toDoEdit: String = ""
    @State private var varBool: Bool = false
    @State var arrIndex: Int = -1
    @State var arrUpdate: Bool = false
    
    private var fullList: Binding<[String]> {
        Binding(
            get: {
                do {
                    return try JSONDecoder().decode([String].self, from: fullListData)
                } catch {
                    return []
                }
            },
            set: { newValue in
                do {
                    fullListData = try JSONEncoder().encode(newValue)
                } catch {
                    print("Error encoding full list: \(error)")
                }
            }
        )
    }
    
    var body: some View {
        if sign_in {
            NavigationView {
                VStack{
                    List {
                        Section(header: Text("Work to do")) {
                            ForEach(Array(fullList.wrappedValue.enumerated()), id: \.element) { index, value in
                                Button(action: {
                                    print(" index = \(index) \n value = \(value)")
                                    arrIndex = index
                                    toDoEdit = value
                                    varBool.toggle()
                                }, label: {
                                    Text(value)
                                        .font(.title.bold())
                                        .foregroundColor(.red)
                                        .padding()
                                })
                                    .sheet(isPresented: $varBool, content: {
                                        SecondView(toDoEdit: $toDoEdit, arrUpdate: $arrUpdate)
                                        
                                    })
                            }
                            
                            .onDelete(perform: delete)
                            .onMove(perform: move)
                            
                            
                        }
                        .onAppear(){
                            if toDoString.count > 0 {
                                fullList.wrappedValue.append(toDoString)
                                toDoString = ""
                            }
                        }
                        
                    }
                    .navigationTitle("To-Do List")
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading){
                            EditButton()
                                .frame(width: .infinity, height: 50)
                                .font(.headline.bold())
                                .foregroundColor(Color("ColorText"))
                        }
                        
                        ToolbarItem(placement: .bottomBar){
                            Button(action: {
                                if toDoEdit.count > 0 {
                                fullList.wrappedValue[arrIndex] = toDoEdit
                                arrUpdate = false
                                }
                            }, label: {
                                Label("", systemImage: "arrow.counterclockwise.icloud.fill")
                                    .font(.title.bold())
                                Text("Click after Edit")
                            })
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                logOut()
                            }, label: {
                                Text("Log-Out")
                                    .frame(width: .infinity, height: 50)
                                    .font(.headline.bold())
                                    .foregroundColor(Color("ColorText"))
                            })
                        }
                        
                    }
                    
                    Spacer()
                    NavigationLink("+ \nADD", destination: {
                        NewToDo(toDoString: $toDoString)
                    })
                        .font(.title.bold())
                        .foregroundColor(.red)
                        .padding()
                    
                    Spacer()
                }
            }
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color.green, Color.blue, Color.white, Color.orange]),
                    center: .center,
                    startRadius: 55,
                    endRadius: 270
                )
            )
        }
        else {
            Sign_Up_and_in()
        }
    }
    
    func delete(at offsets: IndexSet) {
        fullList.wrappedValue.remove(atOffsets: offsets)
    }
    
    func move(indexSet: IndexSet, newIndex: Int){
        fullList.wrappedValue.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
    //    func buttonEdit(editString: String){
    //        print(editString)
    //        EditView(toDoEdit: $toDoEdit)
    //    }
    
    func logOut() {
        name = ""
        age = 0
        gender = ""
        sign_in = false
    }
}


struct SecondView: View{
    @Environment(\.presentationMode) var presentationMode
    @Binding var toDoEdit: String
    @Binding var arrUpdate: Bool
    
    var body: some View {
        VStack{
            TextEditor(text: $toDoEdit)
                .font(.headline)
                .frame(width: 350, height: 600, alignment: .center)
                .colorMultiply(Color("ColorBackground").opacity(0.8))
                .foregroundColor(Color("ColorText"))
                .padding(20)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                arrUpdate = true
            }, label: {
                Text("Save")
                    .font(.title)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.red)
                    .background(.yellow)
                    .border(Color.black, width: 3)
                    .padding(20)
                    .font(.headline)
            })
        }
        .background(Image("OM2"))
        .ignoresSafeArea()
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
