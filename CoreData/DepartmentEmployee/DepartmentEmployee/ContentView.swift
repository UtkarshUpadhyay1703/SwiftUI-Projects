//
//  ContentView.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Department.name, ascending: true)], animation: .default)
    private var departments: FetchedResults<Department>
    
    @State private var addDepartment = false
    @State private var addPerson = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(departments) { department in
                    NavigationLink {
                        List{
                            ForEach(department.employee){ employee in
                                EmployeeDetailCell(employee: employee)
                            }
                        }
                        .navigationTitle("Person in: " + (department.name)!)
                    } label: {
                        Text(department.name ?? "")
                    }
                }
                .onDelete(perform: deleteDepartment)
            }
            .navigationTitle("Apple's")
            .sheet(isPresented: $addDepartment){
                AddDepartment()
            }
            .sheet(isPresented: $addPerson){
                AddEmployee()
            }
            .toolbar {
                //                ToolbarItem(placement: .navigationBarTrailing) {
                //                    EditButton()
                //                }
                //                ToolbarItem {
                //                    Button(action: addItem) {
                //                        Label("Add Item", systemImage: "plus")
                //                    }
                //                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        addDepartment.toggle()
                    } label: {
                        Label("Add Department", systemImage: "building")
                    }
                    Button {
                        addPerson.toggle()
                    } label: {
                        Label("Add Employee", systemImage: "person.fill")
                    }
                    
                }
                
            }
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
    }
    
    private func deleteDepartment(offsets: IndexSet) {
        for index in offsets{
            let departmentToDelete = departments[index]
            viewContext.delete(departmentToDelete)
            saveData()
        }
    }
    
    func saveData() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
