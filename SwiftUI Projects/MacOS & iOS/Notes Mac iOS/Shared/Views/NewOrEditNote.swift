//
//  NewOrEditNote.swift
//  Notes Mac iOS
//
//  Created by admin on 10/26/23.
//
import SwiftUI
//import AlertToast

struct NewOrEditNote: View {
    @State private var editDate = getSampleDate(offset: 0)
    @Binding private var editNote: Note
    @State private var textFieldNote: String = ""
    @State private var titleFieldNote: String = ""
    @State private var passwordNote: String = ""
    @State private var passwordNoteSave: String = ""
    @Binding private var storedNotes: [Note]
    @Binding private var isEditNote: Bool
    @Binding private var rightPassword: Bool
    @State private var titleRight: Bool = false
    @State private var textRight: Bool = false
    
    init(editNote: Binding<Note>, storedNotes: Binding<[Note]>, isEditNote: Binding<Bool>, rightPassword: Binding<Bool>) {
        self._editNote = editNote
        self._storedNotes = storedNotes
        self._isEditNote = isEditNote
        self._rightPassword = rightPassword
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
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        rightPassword = false
                    }
                }
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
                    if textFieldNote == ""{
                        textRight = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            textRight = false
                        }
                    } else{
                        titleRight = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            titleRight = false
                        }
                    }
                } else{
                    if let index = storedNotes.firstIndex(of: editNote) {
                        storedNotes[index].note = textFieldNote
                        storedNotes[index].title = titleFieldNote
                        storedNotes[index].date = editDate
                        storedNotes[index].password = passwordNoteSave
                        print("Ho gaya Disappear: \(passwordNoteSave)")
                        isEditNote = false
                    }
                }
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
        .overlay(
            ZStack{
                VStack{
                    if titleRight {
                        ColorChangingStrip(stripColor: Color(editNote.cardColor), animationDuration: 2.0)
                            .frame(width: titleRight ? .infinity : 0)
                    }
                    ToastView(type: .error, title: "Empty Title", message: "Please Enter Title")
                        .frame(width: titleRight ? .infinity : 0 , height: 100)
                        .offset(y: titleRight ? 0 : 200) // Adjust the vertical offset as needed
                }
                
                VStack{
                    if textRight {
                        ColorChangingStrip(stripColor: Color(editNote.cardColor), animationDuration: 2.0)
                            .frame(width: textRight ? .infinity : 0)
                    }
                    ToastView(type: .error, title: "Empty Text", message: "Please Enter Text")
                        .frame(width: textRight ? .infinity : 0 , height: 100)
                        .offset(y: textRight ? 0 : 200) // Adjust the vertical offset as needed
                }
            }
        )
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
        }
    }
}
