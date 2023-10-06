//
//  AddItemView.swift
//  ItemAndTag
//
//  Created by admin on 10/6/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var itemTitle = ""
    @State private var selectedTag: [Tag] = []
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Tag.title, ascending: true)], animation: .default) private var tags: FetchedResults<Tag>
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Add Item Title", text: $itemTitle)
                VStack{
                    Text("Selected Tags")
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(selectedTag){ selectTag in
                                Button {
                                    if let indexToRemove = selectedTag.firstIndex(of: selectTag){
                                        selectedTag.remove(at: indexToRemove)
                                    }
                                } label: {
                                    Text(selectTag.title ?? "")
                                }
                                .tint(Color(selectTag.color ?? "TagColorRed"))
                                .buttonBorderShape(.roundedRectangle)
                                .buttonStyle(.bordered)
                                .controlSize(.large)
                            }
                        }
                    }
                    Text("Tags")
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(tags){tag in
                                Button {
                                    selectedTag.append(tag)
                                } label: {
                                    Text(tag.title ?? "")
                                }
                                .tint(Color(tag.color ?? "TagColorRed"))
                                .buttonBorderShape(.roundedRectangle)
                                .buttonStyle(.bordered)
                                .controlSize(.large)
                            }
                        }
                    }
                }
                Button {
                    addItem()
                    dismiss()
                } label: {
                    Text("Save")
                }

            }
            .navigationTitle("Add Item")
        }
    }
    
    private func addItem() {
        let item = Item(context: viewContext)
        item.id = UUID()
        item.timestamp = Date()
        item.title = itemTitle
        let uniqueTag = Set(selectedTag)
        for tag in uniqueTag{
            item.addToItemToTag(tag)
        }
        saveData()
    }
    
    private func saveData() {
        do {
            try viewContext.save()
        } catch {
            print("Error in saving the Data:",error)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
