//
//  AddDepartment.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//

import SwiftUI
import CoreData

struct AddDepartment: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var departmentName = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Department Name", text: $departmentName)
                Button {
                    saveDepartment()
                    dismiss()
                } label: {
                    Text("Save Department")
                        .frame(minWidth: 0, maxWidth: .infinity)}
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .tint(.blue)
            }
            .navigationTitle("Add Department")
        }
    }
    
    private func saveDepartment() {
        let newDepartment = Department(context: viewContext)
        newDepartment.id = UUID()
        newDepartment.name = departmentName
        saveData()
    }
    
    private func saveData(){
        do {
            try viewContext.save()
        } catch {
            print("Error in saving data:", error)
        }
    }
}

struct AddDepartment_Previews: PreviewProvider {
    static var previews: some View {
        AddDepartment()
    }
}
