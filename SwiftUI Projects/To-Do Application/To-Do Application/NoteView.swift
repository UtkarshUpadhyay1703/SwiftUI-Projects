//
//  NoteView.swift
//  To-Do Application
//
//  Created by Utkarsh Upadhyay on 22/07/25.
//

import SwiftUI

struct NoteView: View {
    @State private var newNote: String = ""
    @Binding var notes: [String]
    let selectedIndex: Int
    @FocusState private var isFocused:Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                TextEditor(text: $newNote)
                    .frame(width: geometry.size.width * 0.92, height: geometry.size.height * 0.9, alignment: .center)
                    .padding()
                    .colorMultiply(Color("ForegroundBackgroundColor"))
            }
        }
        .onAppear() {
            isFocused = true
            if (selectedIndex >= 0) {
                newNote = notes[selectedIndex]
                notes.remove(at: selectedIndex)
            }
        }
        .onDisappear() {
            notes.insert(newNote, at: 0)
        }
    }
}

#Preview {
    @Previewable @State var notes = ["fghj"]
    NoteView(notes: $notes,selectedIndex: 0)
}
