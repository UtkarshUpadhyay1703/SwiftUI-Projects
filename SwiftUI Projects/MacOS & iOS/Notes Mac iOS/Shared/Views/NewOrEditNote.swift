//
//  NewOrEditNote.swift
//  Notes Mac iOS
//
//  Created by admin on 10/26/23.
//
import SwiftUI

struct NewOrEditNote: View {
    @State private var editDate = getSampleDate(offset: 0)
    @Binding private var editNote: Note
    @State private var textFieldNote: String = ""
    @State private var titleFieldNote: String = ""
    @Binding private var storedNotes: [Note]
    @Binding private var isEditNote: Bool
    
    init(editNote: Binding<Note>, storedNotes: Binding<[Note]>, isEditNote: Binding<Bool>) {
        //        self.editNote = editNote
        self._editNote = editNote
        print("Edit Note = \(editNote.note)")
        //        _textFieldNote = State(initialValue: editNote.note)
        print("_textFieldNote Note = \(_textFieldNote)")
        self._storedNotes = storedNotes
        self._isEditNote = isEditNote
        print("_isEditNote Note = \(_isEditNote)")
    }
    var body: some View{
        VStack{
            Spacer()
            TextField("Title:", text: $titleFieldNote)
                .font(.title.bold())
                .cornerRadius(10)
                .background(Color.white)
                .frame(alignment: .center)
            
            TextEditor(text: $textFieldNote)
            //                .frame(width: 200, height: 400, alignment: .center)
                .font(isMacOS() ? .title2 : .title3)
                .background(Color.black)
                .cornerRadius(10)
            //                .background(Color(editNote.cardColor))
            
            //                .onChange(of: textFieldNote) { newValue in
            //                    //                    note.note = textFieldNote
            //
            //                    // Update the original note's note property
            //                    if let index = storedNotes.firstIndex(of: editNote) {
            //                        storedNotes[index].note = textFieldNote
            //                    }
            //                }
            //                .onDisappear {
            //                    if let index = storedNotes.firstIndex(of: editNote) {
            //                        storedNotes[index].note = textFieldNote
            //                        print("Ho gaya Disappear: \(textFieldNote)")
            //                    }
            //                }
            HStack{
                Spacer()
                DatePicker("  Date: ", selection: $editDate, displayedComponents: .date)
                    .frame(width: 200, height: 50)
                //                    .border(.gray, width: 5)
                    .foregroundColor(.black)
                    .background(Color(editNote.cardColor))
                    .border(.gray, width: 5)
                    .cornerRadius(5)
                Spacer()
                
            }
            .padding(.horizontal, 10)
            Button {
                if (textFieldNote == "" || titleFieldNote == ""){
                    if let index = storedNotes.firstIndex(of: editNote){
                        storedNotes.remove(at: index)
                        print("Not Saved")
                    }
                } else{
                    if let index = storedNotes.firstIndex(of: editNote) {
                        storedNotes[index].note = textFieldNote
                        storedNotes[index].title = titleFieldNote
                        storedNotes[index].date = editDate
                        print("Ho gaya Disappear: \(textFieldNote)")
                    }
                }
                isEditNote.toggle()
            } label: {
                Text("Save")
                    .font(.title2.bold())
                    .frame(width: 80, height: 20)
                    .background(Color.purple)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .background(Color(editNote.cardColor))
#if os(macOS)
        .frame(width: 400, height: 700, alignment: .center)
#endif
        .onAppear {
            //            print("On Appear Edit Note = \(editNote.note)")
            textFieldNote = editNote.note
            titleFieldNote = editNote.title
            editDate = editNote.date
            //            print("_textFieldNote Note = \(_textFieldNote)")
            //            print("_isEditNote Note = \(_isEditNote)")
        }
    }
}
