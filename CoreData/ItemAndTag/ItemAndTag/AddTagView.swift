//
//  AddTagView.swift
//  ItemAndTag
//
//  Created by admin on 10/6/23.
//

import SwiftUI

struct AddTagView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var tagTitle = ""
    @State private var selectedColor = 0
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Add Tag Title", text: $tagTitle)
                Picker("Select Colors", selection: $selectedColor) {
                    ForEach(0..<ExtraColor.colorsNames.count, id: \.self){ index in
                        HStack{
                            Circle()
                                .fill(Color(ExtraColor.colorsNames[index]))
                                .frame(width: 40, height: 40)
                            Text(ExtraColor.colorsNames[index])
                                .tag(index)
                        }
                    }
                    .navigationTitle("Select Colors")
                }
                Button {
                    // Add function to add tag
                    addTagItem()
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
    private func addTagItem() {
        let tag = Tag(context: viewContext)
        tag.id = UUID()
        tag.title = tagTitle
        tag.color = ExtraColor.colors[selectedColor]
        saveData()
    }
    
    private func saveData(){
        do {
            try viewContext.save()
        } catch {
            print("Error in saving data: ", error)
        }
    }
}

struct AddTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddTagView()
    }
}
