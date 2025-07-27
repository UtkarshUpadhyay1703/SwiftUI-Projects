//
//  ContentView.swift
//  To-Do Application
//
//  Created by Utkarsh Upadhyay on 19/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HandelOperations()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    List {
                        Section {
                            ForEach(viewModel.toDoList.indices, id: \.self) { index in
                                NavigationLink {
                                    NoteView(notes: $viewModel.toDoList, selectedIndex: index)
                                } label: {
                                    Text(viewModel.toDoList[index])
                                        .lineLimit(1)
                                }
                                .shadow(radius: 5, x: 5, y: 5)
                            }
                            .onDelete { indexSet in
                                viewModel.toDoList.remove(atOffsets: indexSet)
                            }
                            .onMove { (indices, newOffset) in
                                viewModel.toDoList.move(fromOffsets: indices, toOffset: newOffset)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                        .font(.title2)
                })
                
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink {
                        NoteView(notes: $viewModel.toDoList, selectedIndex: -1)
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
