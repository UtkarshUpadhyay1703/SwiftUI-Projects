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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
        TextEditor(text: $newNote)
                .frame(width: 350, height: 700, alignment: .center)
                .padding()
                .colorMultiply(Color("ForegroundBackgroundColor"))
            
            Spacer()
            
            Button {
                notes.insert(newNote, at: 0)
                dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
                    .padding()
                    .background(.secondary)
                    .cornerRadius(10)
            }
            .foregroundColor(.primary)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            if (selectedIndex >= 0) {
                newNote = notes[selectedIndex]
                notes.remove(at: selectedIndex)
            }
        }
    }
}

#Preview {
    @Previewable @State var notes = ["fghj"]
    NoteView(notes: $notes,selectedIndex: 0)
}
