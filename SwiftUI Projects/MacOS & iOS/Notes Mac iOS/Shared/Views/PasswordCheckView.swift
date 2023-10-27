//
//  PasswordCheckView.swift
//  Notes Mac iOS
//
//  Created by admin on 10/26/23.
//

import SwiftUI

struct PasswordCheckView: View {
    @Binding private var editNote: Note
    @State private var checkPassword: String = ""
    @Binding private var isPassword: Bool
    @Binding private var isEditNote: Bool
    @Binding private var isEditNoteCall: Bool
    @Binding private var storedNotes: [Note]
    
    init(editNote: Binding<Note>, isPassword: Binding<Bool>, isEditNote: Binding<Bool>, isEditNoteCall: Binding<Bool>, storedNotes: Binding<[Note]>){
        self._editNote = editNote
        self._isPassword = isPassword
        self._isEditNote = isEditNote
        self._isEditNoteCall = isEditNoteCall
        self._storedNotes = storedNotes
    }
    
    var body: some View {
        VStack{
            Spacer()
            if !isEditNoteCall {
                if editNote.password == "" {
                    Text("Enter Password to setup Lock: ")
                } else {
                    Text("Enter Password to Disable Lock: ")
                }
            } else{
                Text("Enter Password To Edit: ")
            }
            TextField("password", text: $checkPassword)
            Button {
                print("Password = \(checkPassword)  real = \(editNote.password)")
                
                if isEditNoteCall{
                    if checkPassword == editNote.password{
                        isEditNote = true
                    }
                } else{
                    if editNote.password == "" {
                        if let index = storedNotes.firstIndex(of: editNote) {
                            storedNotes[index].password = checkPassword
                            print("Password Setup to: \(checkPassword)")
                        }
                    }else {
                        if checkPassword == editNote.password{
                            if let index = storedNotes.firstIndex(of: editNote) {
                                storedNotes[index].password = ""
                                print("Password Setup to: \"\"")
                            }
                        }
                    }
                }
                isPassword = false
            } label: {
                editNote.password == "" ? Text("Save") :
                Text("Submit")
            }
            Spacer()
        }
        .onAppear {
            if editNote.password == "" {
                if isEditNoteCall {
                    isEditNote = true
                    isPassword = false
                }else{
                    //                    storedNotes =
                }
            }else{
                if !isEditNoteCall {
                    
                }
            }
        }
    }
}
