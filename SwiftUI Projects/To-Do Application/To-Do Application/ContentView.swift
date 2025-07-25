//
//  ContentView.swift
//  To-Do Application
//
//  Created by Utkarsh Upadhyay on 19/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [String] = ["aa", "kjhgfdcx", "jhtyretyui", "fdghjgfgf", "hewgo;ihgiwehrghwnrhigwhnr;otho;wthrhuhwurgwiylrgjnfqwrohfow;bgruf;q;gbgqrhuegqhb.bfjqebrquh"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    List {
                        Section {
                            ForEach(notes.indices, id: \.self) { index in
                                NavigationLink {
                                    NoteView(notes: $notes, selectedIndex: index)
                                } label: {
                                    Text(notes[index])
                                }
                                .shadow(radius: 5, x: 5, y: 5)
                            }
                            .onDelete { indexSet in
                                notes.remove(atOffsets: indexSet)
                            }
                            .onMove { (indices, newOffset) in
                                notes.move(fromOffsets: indices, toOffset: newOffset)
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
                        NoteView(notes: $notes, selectedIndex: -1)
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
