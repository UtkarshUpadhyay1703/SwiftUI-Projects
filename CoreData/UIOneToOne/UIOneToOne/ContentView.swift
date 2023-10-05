//
//  ContentView.swift
//  UIOneToOne
//
//  Created by admin on 10/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var persistentController = PersistenceController()

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Person>

    var body: some View {
        NavigationView {
            List {
                Text("Person's List")
                    .background(Color.yellow)
                
                ForEach(persistentController.savedPerson) { item in
                    NavigationLink {
                        Text("Item email: \(item.email ?? "")")
                        Text("Item's Number: \(item.phones?.number ?? "")")
                    } label: {
                        Text(item.email ?? "")
                    }
                }
                .onDelete(perform: deletePerson)
                
                Text("Phone's List")
                    .background(Color.yellow)
                ForEach(persistentController.savedPhone) { item in
                    NavigationLink {
                        Text("Item Number: \(item.number ?? "")")
                    } label: {
                        Text(item.number ?? "")
                    }
                }
                .onDelete(perform: deletePhone)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                            addView()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            Text("Select an item")
        }
    }
    
    

    private func deletePerson(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                print(persistentController.deletePerson(person: persistentController.savedPerson[$0])) }
            persistentController.fetchPerson()
        }
    }
    
    private func deletePhone(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                print(persistentController.deletePhone(phone: persistentController.savedPhone[$0])) }
            persistentController.fetchPhone()
        }
    }
}

struct addView: View{
    @State private var emailField: String = ""
    @State private var numberField: String = ""
    @ObservedObject var persistentController = PersistenceController()
    
    var body: some View{
        VStack{
            Text("Enter Email:")
            TextField("email@123.com", text: $emailField)
            Text("Enter Phone Number:")
            TextField("1234567890", text: $numberField)
            Button {
                addPersonAndPhone()
                persistentController.fetchPhone()
                persistentController.fetchPerson()
            } label: {
                Text("Save")
            }

        }
    }
    
    private func addPersonAndPhone(){
        if (emailField.count == 0 || numberField.count == 0) {
            print("Please enter Email and Number")
        }else{
            let personModel = PersonModel()
            personModel.email = emailField
            
            let phoneModel = PhoneModel()
            phoneModel.number = numberField
            personModel.phones = phoneModel
            print("phoneModel Number = \(personModel.phones?.number ?? "Nof") \n numberField = \(numberField)")
            print(persistentController.addPerson(person: personModel))
            persistentController.fetchPhone()
            persistentController.fetchPerson()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
