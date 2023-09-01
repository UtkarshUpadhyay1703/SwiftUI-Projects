//
//  ContentView.swift
//  CoreData Usage
//
//  Created by admin on 8/31/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors
        : [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)]) private var fruits: FetchedResults<FruitEntity>
    
    @State private var textFieldText: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 40){
                TextField("Add Fruits ...", text: $textFieldText)
                Button(action: {
                    addItem()
                }, label: {
                    Text("Add")
                        .font(.title2.bold())
                        .foregroundColor(.yellow)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(.red)
                        .cornerRadius(10)
                })
                    .padding(.horizontal)
                List {
                    ForEach(fruits) { fruit in
                        NavigationLink {
                            Text(fruit.name!)
                        } label: {
                            Text(fruit.name!)
                        }
                        .onTapGesture {
                            updateItem(fruit: fruit)
                        }
                        
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = textFieldText
            
            saveItems()
            textFieldText = ""
        }
    }
    
    private func updateItem(fruit: FruitEntity) {
        withAnimation {
            let oldFruit = fruit.name!
            let newFruit = oldFruit + "!"
            fruit.name = newFruit
            //            fruit.name?.append(contentsOf: "!")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
            
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
