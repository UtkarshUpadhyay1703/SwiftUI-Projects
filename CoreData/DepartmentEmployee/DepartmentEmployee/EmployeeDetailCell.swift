//
//  EmployeeDetailCell.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//

import SwiftUI

struct EmployeeDetailCell: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var employee: Employee
    
    var body: some View {
        VStack{
            HStack{
                if( employee.profileImage != nil){
                    Image(uiImage: UIImage(data: employee.profileImage!)!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                VStack(alignment: .leading){
                    Text("Name: " + (employee.name ?? "")).font(.title2)
                    Text("Age: \(employee.age)").foregroundColor(.gray)
                }
            }
        }
        .swipeActions(edge: .trailing){
            Button(role: .destructive, action: {deleteEmployee()}, label: {Label("Delete Employee", systemImage: "trash")})
        }
    }
    
    private func deleteEmployee(){
        let employeeToDelete = employee
        viewContext.delete(employeeToDelete)
        saveData()
    }
    
    private func saveData(){
        do {
            try viewContext.save()
        } catch {
            print("Error in saving the data: ", error)
        }
    }
}
