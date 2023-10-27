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
    @State private var passwordNote: String = ""
    @State private var passwordNoteSave: String = ""
//    @Binding private var isPassword: Bool
//    @State private var isPasswordCorrect: Bool = false
    @Binding private var storedNotes: [Note]
    @Binding private var isEditNote: Bool
    
//    init(editNote: Binding<Note>, storedNotes: Binding<[Note]>, isEditNote: Binding<Bool>, isPassword: Binding<Bool>) {
//        self._editNote = editNote
//        self._storedNotes = storedNotes
//        self._isEditNote = isEditNote
//        self._isPassword = isPassword
//    }
    init(editNote: Binding<Note>, storedNotes: Binding<[Note]>, isEditNote: Binding<Bool>) {
        self._editNote = editNote
        self._storedNotes = storedNotes
        self._isEditNote = isEditNote
//        self._isPassword = isPassword
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
                    .font(isMacOS() ? .title2 : .title3)
                    .background(Color.black)
                    .cornerRadius(10)
                HStack{
                    Spacer()
                    DatePicker("  Date: ", selection: $editDate, displayedComponents: .date)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.black)
                        .background(Color(editNote.cardColor))
                        .border(.gray, width: 5)
                        .cornerRadius(5)
                    Spacer()
                    
                }
                .padding(.horizontal, 10)
                HStack{
                    Text("Enter Password")
                        .font(.title2.bold())
                    TextField("Password...", text: $passwordNoteSave)
                        .font(.title2)
                        .cornerRadius(10)
                        .background(Color.white)
                        .frame(alignment: .center)
                }
                
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
                            storedNotes[index].password = passwordNoteSave
                            print("Ho gaya Disappear: \(passwordNoteSave)")
                        }
                    }
//                    isPassword = false
                    isEditNote = false
                } label: {
                    Text("Save")
                        .font(.title2.bold())
                        .frame(width: isMacOS() ? 80 : 150, height: isMacOS() ? 20 : 50)
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
            textFieldNote = editNote.note
            titleFieldNote = editNote.title
            editDate = editNote.date
            passwordNoteSave = editNote.password
//            if editNote.password == ""{
//                isPasswordCorrect = true
//            }
        }
    }
    
//    @ViewBuilder
//    func passwordCheckView() -> some View {
//        VStack{
//            Text("Enter Password \(String(isPasswordCorrect))")
//            TextField("password", text: $passwordNote)
//            Button {
//                print("Passworf = \(passwordNote)  real = \(editNote.password)")
//                isPassword = false
//                if passwordNote == editNote.password{
//                    isPasswordCorrect = true
//                    isEditNote = true
//                }
//            } label: {
//                Text("Submit")
//            }
//        }
//    }
}

//struct MyPreviewProvider_Previews: PreviewProvider {
//    static var previews: some View {
//        NewOrEditNote(editNote: Binding<Note>, storedNotes: Binding<[Note]>, isEditNote: Binding<Bool>)
//    }
//}
