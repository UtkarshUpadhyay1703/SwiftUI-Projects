//
//  ContentView.swift
//  List Use
//
//  Created by admin on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var arr: [String] = ["Apple", "Orange", "banana", "Grapes"]
    var body: some View {
//        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
//            Text("Hello, world!")
//                .padding()
//        }
        
        
        
//        List{
//            ForEach(arr, id: \.self) { fruits in
//                Text(fruits.capitalized)
//            }
//        }
        
        NavigationView{
        List{
//            Section(content: Text("Fruits"), header: ForEach(arr, id: \.self) { fruits in
//                Text(fruits)
//            })
            
            
//            Section(content: ForEach(arr, id: \.self) { fruits in
//                                Text(fruits)
//                            }, header: Text("Fruits"))
            
            Section(header: Text("Fruits")) {
                ForEach(arr, id: \.self) { fruit in
                    Text(fruit.capitalized)
                }
//                ForEach(arr.indices) { fruit in
//                    Text(arr[fruit].capitalized)
//                }
//                .onDelete(perform: {indexSet in
//                    arr.remove(atOffsets: indexSet)
//                })
                
                
                .onDelete(perform: delete(indexSet:))
                .onMove(perform: move)
            }
        }
        .accentColor(.green)
        .navigationTitle("Grocery Items")
        .navigationBarItems(
            leading: EditButton(),
//            trailing: Button("Add",action: { arr.append("Dragon Fruit") })
            trailing: AddButton
        )
    }
        .accentColor(.orange)
}
    
    var AddButton: some View {
        Button("Add", action: {add()})
    }
    
    func delete(indexSet: IndexSet) {
        arr.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newIndex: Int){
        arr.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
    func add() {
        arr.append("Dragon Fruit")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
