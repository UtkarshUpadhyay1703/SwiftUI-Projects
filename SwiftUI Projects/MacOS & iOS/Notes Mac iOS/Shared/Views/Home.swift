//
//  Home.swift
//  Notes Mac iOS (iOS)
//
//  Created by admin on 10/19/23.
//

import SwiftUI

struct Home: View {
    //Showing Card colors on button click
    @State var showColors: Bool = false
    // Button Animation
    @State var animateButton: Bool = false
    @AppStorage("storedNotes") private var storedNotesData: Data?
    
    @State var filteredNotes: [Note]  = [ ]
    @State private var searchField: String = ""
    @State var storedNotes: [Note]  = [ ]
    @State private var isEditNote: Bool = false
    @State private var isNewNote: Bool = false
    @State private var editNote: Note = Note(title: "",note: "", date: getSampleDate(offset: 1), cardColor: "Color-Orange")
    
    //    init() {
    //        if let data = storedNotesData,
    //           let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
    //            _storedNotes = State(initialValue: decodedNotes)
    //            _filteredNotes = State(initialValue: decodedNotes)
    //            print("Kuch to h!!!!! \(storedNotes.count)  \(filteredNotes.count)")
    //        }
    //                else {
    //                    print("Kuch bhi nahi h!!!!!")
    //                    storedNotes = notes
    //                    filteredNotes = notes
    //                    if let encodedData = try? JSONEncoder().encode(storedNotes) {
    //                        storedNotesData = encodedData
    //                        print("Encode kar k aagaya!!!!")
    //                    }
    //                }
    //    }
    
    var body: some View {
        HStack(spacing: 0){
            //Side Bar
            if isMacOS(){
                Group{
                    SideBar()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            //Main Content
            MainContent()
            //                .onAppear{
            //                    storedNotes = notes
            //                    filteredNotes = storedNotes
            //                }
                .onAppear {
                    if let data = storedNotesData,
                       let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                        _storedNotes.wrappedValue = decodedNotes
                        _filteredNotes.wrappedValue = decodedNotes
                        print("Kuch to h!!!!! \(_storedNotes.wrappedValue.count)")
                    } else {
                        print("Kuch bhi nahi h!!!!!")
                        storedNotes = notes
                        filteredNotes = notes
                        saveNotes()
                    }
                }
            
        }
        
#if os(macOS)
        .ignoresSafeArea()
#endif
        .frame(width: isMacOS() ? getReact().width / 1.7 : nil, height: isMacOS() ? getReact().height - 180 : nil, alignment: .leading)
        .background(Color.whiteColor.ignoresSafeArea())
#if os(iOS)
        .overlay(SideBar())
#endif
        .preferredColorScheme(.light)
        
        //        .sheet(isPresented: $isEditNote) {
        //            NewOrEditNote(note: noteForEdit, storedNotes: storedNotes)
        //        }
        //        .onDisappear {
        //            if let encodedData = try? JSONEncoder().encode(storedNotes) {
        //                storedNotesData = encodedData
        //                print("Encode kar k aagaya!!!!")
        //            }
        //        }
        
    }
    
    
    
    @ViewBuilder
    func MainContent() -> some View {
        VStack(spacing: 6){
            HStack(spacing: 8){
                //Search Bar
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(Color.gray)
                
                TextField("Search", text: $searchField)
                    .onChange(of: searchField) { newValue in
                        if (searchField == "") {
                            filteredNotes = storedNotes
                        }
                        else {
                            //                                filteredNotes = storedNotes.filter({ $0.title.contains(searchField) })
                            filteredNotes = storedNotes.filter { note in
                                // Use the range(of:options:) method with the .caseInsensitive option
                                return note.title.range(of: searchField, options: .caseInsensitive) != nil
                            }
                        }
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, isMacOS() ? 0 : 10)
            .overlay(
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 1)
                    .padding(.horizontal, -25)
                //Moving offser
                    .offset(y: 6),
                alignment: .bottom
            )
            
            //            Button {
            //                storedNotes = storedNotes.filter({ note in
            //                    return note.title == ""
            //                })
            //                print("Number = \(storedNotes.count)")
            //                filteredNotes = storedNotes
            //
            //                if let encodedData = try? JSONEncoder().encode(storedNotes) {
            //                    storedNotesData = encodedData
            //                    print("Encode kar k aagaya)))))")
            //                }
            //            } label: {
            //                Text("Action")
            //            }
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("Notes")
                        .font( isMacOS() ? .system(size: 33, weight: .bold) : .largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Column
                    let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS() ? 25 : 15), count: isMacOS() ? 3 : 1)
                    LazyVGrid(columns: columns, spacing: 25){
                        //Notes
                        ForEach(filteredNotes){note in
                            //Card View
                            CardView(note: note)
                        }
                        //                        .onChange(of: isEditNote) { notes in
                        //                            if let encodedData = try? JSONEncoder().encode(storedNotes) {
                        //                                storedNotesData = encodedData
                        //                                print("Encode kar k aagaya@@@")
                        //                            }
                        //                        }
                        //                        .onChange(of: storedNotes) { notes in
                        //                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        //                                if let encodedData = try? JSONEncoder().encode(storedNotes) {
                        //                                    storedNotesData = encodedData
                        //                                    print("Encode kar k aagaya@")
                        //                                    print("Note: \(encodedData)")
                        //                                }
                        //                            }
                        //                        }
                    }
                    .padding(.top, 30)
                }
                .padding(.top, isMacOS() ? 45 : 30)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, isMacOS() ? 40 : 15)
        .padding(.horizontal, 25)
    }
    
    @ViewBuilder
    func CardView(note: Note) -> some View {
        VStack{
            Text(note.title)
                .font(isMacOS() ? .title2 : .title3)
                .bold()
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(note.note)
                .font(isMacOS() ? .title3 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            //            }
            HStack{
                Text(note.date, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Spacer(minLength: 0)
                //Edit Button
                Button {
                    //                    noteForEdit = note
                    //                    EditNote(note: note)
                    //                        .onChange(of: textFieldNote) { newValue in
                    //                    textFieldNote = note.note
                    //                        }
                    editNote = note
                    //                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    //                        isEditNote.toggle()
                    //                    }
                    isEditNote.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $isEditNote) {
                    NewOrEditNote(editNote: $editNote, storedNotes: $storedNotes, isEditNote: $isEditNote)
                    
                    
                        .onDisappear{
                            
                            //                            if let index = storedNotes.firstIndex(of: editNote) {
                            //                                storedNotes[index].note = textFieldNote
                            //                            }
                            
                            filteredNotes = storedNotes
                            
                            saveNotes()
                        }
                }
                
                //                .onChange(of: isEditNote) { notes in
                //                    print("Galat ho gaya!!!!!!")
                //                    if let encodedData = try? JSONEncoder().encode(storedNotes) {
                //                        storedNotesData = encodedData
                //                        print("Encode kar k aagaya!!!!")
                //                    }
                //                }
                
                Button {
                    //                    storedNotes.remove(at: index)
                    if let index = storedNotes.firstIndex(of: note){
                        storedNotes.remove(at: index)
                        filteredNotes = storedNotes
                        
                        saveNotes()
                    }
                    //                    if let index = storedNotes.firstIndex(of: editNote) {
                    //                        storedNotes[index].note = textFieldNote
                    //                    }
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                
            }
            .padding(.top, 55)
        }
        .padding()
        .background(Color(note.cardColor))
        .cornerRadius(18)
    }
    
    @ViewBuilder
    func SideBar() -> some View {
        VStack{
            if isMacOS(){
                Text("Pocket")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            // Add Button
            if isMacOS(){
                AddButton()
                    .zIndex(1)
            }
            
            VStack(spacing: 15){
                //Colors
                let colors = ["Color-Red", "Color-Green", "Color-Blue", "Color-Yellow", "Color-Orange"]
                //                let colors = [Color.redColor, Color.greenColor, Color.blueColor, Color.yellowColor, Color.orangeColor]
                
                ForEach(colors, id: \.self){color in
                    Circle()
                        .fill(Color(color))
                    //                        .fill(color)
                        .frame(width: isMacOS() ? 20 : 25, height: isMacOS() ? 20 : 25)
                        .onTapGesture {
                            editNote = Note(id: "", title: "", note: "", date: getSampleDate(offset: 0), cardColor: color)
                            storedNotes.append(editNote)
                            isNewNote.toggle()
                        }
                        .sheet(isPresented: $isNewNote) {
                            NewOrEditNote(editNote: $editNote, storedNotes: $storedNotes, isEditNote: $isNewNote)
                                .onDisappear{
                                    filteredNotes = storedNotes
                                    
                                    saveNotes()
                                }
                        }
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
            
            if !isMacOS(){
                AddButton()
                    .zIndex(1)
            }
        }
#if os(macOS)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        .padding(.top, 35)
#else
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
        //Blur View
        .background( BlurView(style: .systemUltraThinMaterialDark)
                        .opacity( showColors ? 1: 0).ignoresSafeArea())
#endif
    }
    
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                showColors.toggle()
                animateButton.toggle()
            }
            
            //Resetting the Button
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    animateButton.toggle()
                }
            }
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(Color.white)
                .scaleEffect(animateButton ? 1.1 : 1)
                .padding(isMacOS() ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0))
        .scaleEffect(animateButton ? 1.1 : 1)
        .padding(.top, 30)
    }
    func saveNotes(){
        if let encodedData = try? JSONEncoder().encode(storedNotes) {
            storedNotesData = encodedData
            print("Encode kar k aagaya)))))")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    func getReact() -> CGRect {
#if os(iOS)
        return UIScreen.main.bounds
#else
        return NSScreen.main!.visibleFrame
#endif
    }
    
    func isMacOS() -> Bool {
#if os(iOS)
        return false
#endif
        return true
        
    }
}

//Hiding Focus Ring
#if os(macOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif


