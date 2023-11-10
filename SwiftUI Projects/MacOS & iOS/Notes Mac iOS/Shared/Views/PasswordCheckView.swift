//
//  PasswordCheckView.swift
//  Notes Mac iOS
//
//  Created by admin on 10/26/23.
import SwiftUI

struct PasswordCheckView: View {
    @Binding private var editNote: Note
    @State private var checkPassword: String = ""
    @Binding private var isPassword: Bool
    @Binding private var isEditNote: Bool
    @Binding private var isEditNoteCall: Bool
    @Binding private var storedNotes: [Note]
    @Binding private var wrongPassword: Bool
    @Binding private var rightPassword: Bool
    @Binding private var noteDeleted: Bool
    @Binding private var noteDeletedToast: Bool
    
    init(editNote: Binding<Note>, isPassword: Binding<Bool>, isEditNote: Binding<Bool>, isEditNoteCall: Binding<Bool>, storedNotes: Binding<[Note]>, wrongPassword: Binding<Bool>, rightPassword: Binding<Bool>, noteDeleted: Binding<Bool>, noteDeletedToast: Binding<Bool>){
        self._editNote = editNote
        self._isPassword = isPassword
        self._isEditNote = isEditNote
        self._isEditNoteCall = isEditNoteCall
        self._storedNotes = storedNotes
        self._wrongPassword = wrongPassword
        self._rightPassword = rightPassword
        self._noteDeleted = noteDeleted
        self._noteDeletedToast = noteDeletedToast
    }
    
    func delayWrongPassword(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            wrongPassword = false
            print("False kar diya@@")
        }
    }
    
    var body: some View {
        VStack{
//            Text("isPassword = \(String(isPassword)), isEditNote = \(String(isEditNote)), rightPassword = \(String(rightPassword)) ")
            Spacer(minLength: 2)
            if !isEditNoteCall {
                if noteDeleted{
                    Text("Password For Delete: ")
                        .padding()
                        .font(.title.bold())
                        .background(Color.gray)
                        .cornerRadius(10)
                        .frame(alignment: .center)
                }
                else if editNote.password == "" {
                    Text("Password to setup Lock:")
                        .padding()
                        .font(.title.bold())
                        .background(Color.gray)
                        .cornerRadius(10)
                        .frame(alignment: .center)
                    
                } else {
                    Text("Password to Disable Lock: ")
                        .padding()
                        .font(.title.bold())
                        .background(Color.gray)
                        .cornerRadius(10)
                        .frame(alignment: .center)
                }
            } else {
                Text("Password To Edit: ")
                    .padding()
                    .font(.title.bold())
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(alignment: .center)
            }
            Spacer(minLength: 2)
            TextField("password...", text: $checkPassword)
                .font(.title2)
                .cornerRadius(10)
                .background(Color.white)
                .frame(alignment: .center)
            Spacer(minLength: 2)
            Button {
                print("Password = \(checkPassword)  real = \(editNote.password)")
                
                if isEditNoteCall{
                    if checkPassword == editNote.password{
                        rightPassword = true
                        isEditNote = true
                    }else {
                        print("Wrong password######")
                        wrongPassword = true
                        delayWrongPassword()
                    }
                } else if noteDeleted{
                    if checkPassword == editNote.password{
                        rightPassword = true
                        noteDeletedToast = true
                        print("checked Password and called delete")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            if noteDeleted {
                                NotificationManager.instance.cancleSpecificLocalNotification(identifier: editNote.id)
                                if let index = storedNotes.firstIndex(of: editNote){
                                    storedNotes.remove(at: index)
                                }
                            }
                            rightPassword = false
                            noteDeletedToast = false
                        }
                    }else {
                        print("Wrong password######")
                        wrongPassword = true
                        delayWrongPassword()
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
                        }else {
                            print("Wrongg PASSSSSS")
                            wrongPassword = true
                            delayWrongPassword()
                        }
                    }
                }
                isPassword = false
            } label: {
                editNote.password == "" ?
                Text("Save")
                    .font(.title2.bold())
                    .frame(width: isMacOS() ? 80 : 150, height: isMacOS() ? 20 : 50)
                    .background(Color.purple)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                :
                Text("Submit")
                    .font(.title2)
                    .font(.title2.bold())
                    .frame(width: isMacOS() ? 80 : 150, height: isMacOS() ? 20 : 50)
                    .background(Color.purple)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            //            .padding(10)
            //            Spacer()
            //            Spacer()
            //            Spacer()
            //            Spacer()
        }
        .frame(width: isMacOS() ? 300 : nil, height: isMacOS() ? 200 : nil, alignment: .center)
        //        .padding(.horizontal, 50)
        //        .padding(.vertical, 100)
        .padding()
        .background(Color(editNote.cardColor))
        
        .onAppear {
            if editNote.password == "" {
                if isEditNoteCall {
                    isEditNote = true
                    isPassword = false
                } else if noteDeleted{
                    rightPassword = true
                    noteDeletedToast = true
                    print("checked Password and called delete")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        if noteDeleted {
                            NotificationManager.instance.cancleSpecificLocalNotification(identifier: editNote.id)
                            if let index = storedNotes.firstIndex(of: editNote){
                                storedNotes.remove(at: index)
                            }
                        }
                        rightPassword = false
                        noteDeletedToast = false
                    }
                    if isMacOS(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isPassword = false
                        }
                    }else{
                        isPassword = false
                    }
                }
            }
        }
    }
}
