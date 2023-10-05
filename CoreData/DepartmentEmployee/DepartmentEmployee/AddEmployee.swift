//
//  AddEmployee.swift
//  DepartmentEmployee
//
//  Created by admin on 10/5/23.
//

import SwiftUI
import CoreData

struct AddEmployee: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var personName = ""
    @State private var personImage = UIImage()
    @State private var personAge = ""
    @State private var imagePicker = false
    @State private var selectedDepartment = Department()
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Department.name, ascending: true)], animation: .default) private var departments: FetchedResults<Department>
    
    var body: some View {
        NavigationView{
            Form{
                VStack{
                    Image(uiImage: personImage)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle()
                                    .stroke(Color.gray, lineWidth: 5))
                    Button {
                        imagePicker.toggle()
                    } label: {
                        Text("Add Image")
                    }
                    .sheet(isPresented: $imagePicker){
                        ImagePickerView(selectedImage: $personImage)
                    }
                }
                TextField("Add Person Name", text: $personName)
                TextField("Add Person Age", text: $personAge).keyboardType(.decimalPad)
                
                Picker("Select Employee Department", selection: $selectedDepartment){
                    ForEach(departments, id: \.self){
                        Text($0.name ?? "")
                    }
                }
                
                Button {
                    addEmployee()
                    dismiss()
                } label: {
                    Text("Save Person")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .tint(.blue)

            }
        }
    }
    
    private func addEmployee(){
        let newEmployee = Employee(context: viewContext)
        newEmployee.id = UUID()
        newEmployee.name = personName
        newEmployee.age = Int16(personAge)!
        newEmployee.profileImage = personImage.pngData()
        newEmployee.employeeToDepartment = selectedDepartment
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

struct AddEmployee_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployee()
    }
}
