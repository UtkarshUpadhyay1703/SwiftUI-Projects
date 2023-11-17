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
    @State private var isEditNoteCall: Bool = false
    @State private var isNewNote: Bool = false
    @State private var isPassword: Bool = false
    @State private var wrongPasswordToast: Bool = false
    @State private var rightPassword: Bool = false
    @State private var noteDeleted: Bool = false
    @State private var noteDeletedToast: Bool = false
    @State private var sortingAlgo: [String] = ["Date Of Creation", "Title", "Date Of Reminder", "Color"]
    @State private var sortedValue: String = "Date Of Creation"
    @State private var isAcending: Bool = true
    
    @State private var editNote: Note = Note(title: "",note: "", date: getSampleDate(offset: 1), cardColor: "Color-Orange", password: "")
    
    fileprivate func sortNotesFunction() {
        if sortedValue == "Date Of Creation" {
            if isAcending{
                filteredNotes = storedNotes
            }else {
                filteredNotes = []
                var index = storedNotes.count - 1
                while(index >= 0) {
                    filteredNotes.append(storedNotes[index])
                    index-=1
                }
            }
        } else if sortedValue == "Title" {
            if isAcending{
                filteredNotes.sort { $0.title < $1.title }
            }else{
                filteredNotes.sort { $0.title > $1.title }
            }
        } else if sortedValue == "Date Of Reminder" {
            if isAcending{
                filteredNotes.sort { $0.date < $1.date }
            }else{
                filteredNotes.sort { $0.date > $1.date }
            }
        } else {
            if isAcending{
                filteredNotes.sort { $0.cardColor < $1.cardColor }
            }else{
                filteredNotes.sort { $0.cardColor > $1.cardColor }
            }
        }
    }
    
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
                .onChange(of: sortedValue) { newValue in
                    sortNotesFunction()
                }
                .overlay(
                    ZStack{
                        VStack{
                            if noteDeletedToast{
                                ColorChangingStrip(stripColor: .redColor, animationDuration: 4.0)
                                    .frame(width: noteDeletedToast ? .infinity : 0)
                            }
                            
                            ToastView(type: .error, title: "Tab if not wanted to Delete", message: "This note is going to be deleted, \n if does not want to delete then Tab on this Alert")
                                .frame(width: noteDeletedToast ? .infinity : 0 , height: 100)
                                .offset(y: noteDeletedToast ? 0 : 200) // Adjust the vertical offset as needed
                                .onTapGesture {
                                    noteDeleted = false
                                    rightPassword = false
                                    noteDeletedToast = false
                                }
                        }
                        VStack{
                            if wrongPasswordToast{
                                ColorChangingStrip(stripColor: .redColor, animationDuration: 2.0)
                                    .frame(width: wrongPasswordToast ? .infinity : 0)
                            }
                            ToastView(type: .error, title: "Wrong Password", message: "Please enter right password")
                                .frame(width: wrongPasswordToast ? .infinity : 0 , height: 100)
                                .offset(y: wrongPasswordToast ? 0 : 200) // Adjust the vertical offset as needed
                        }
                    }
                )
            
                .onAppear {
                    //                    If any error then to format the storage use these 3 lines of code only
                    //                                        storedNotes = notes
                    //                                        filteredNotes = notes
                    //                                        saveNotes()
                    
                    //If all right then run these lines
                    if let data = storedNotesData,
                       let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                        _storedNotes.wrappedValue = decodedNotes
                        _filteredNotes.wrappedValue = decodedNotes
                        print("Kuch to h!!!!! \(_storedNotes.wrappedValue.count)")
                    }
                    else {
                        print("Kuch bhi nahi h!!!!!")
                        storedNotes = notes
                        filteredNotes = notes
                        saveNotes()
                    }
                    
                    //Setting up the notification
                    NotificationManager.instance.requestAuthorization()
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
            Spacer()
            SortOrder()
            
            
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
    func SortOrder() -> some View {
        if isMacOS(){
            Picker(selection: $sortedValue) {
                ForEach(sortingAlgo.indices){ index in
                    Text(sortingAlgo[index])
                        .foregroundColor(Color.purple)
                        .tag(sortingAlgo[index])
                }
            } label: {
                HStack{
                    Text("  Soring Order: ")
                        .font(.title3.bold())
                        .padding(5)
                        .background(Color.purple)
                        .cornerRadius(5)
                    Image(systemName: isAcending ? "arrow.down" : "arrow.up")
                        .padding(5)
                        .background(Color.purple)
                        .cornerRadius(5)
                        .onTapGesture {
                            isAcending.toggle()
                            sortNotesFunction()
                        }
                }
            }
            .background(Color.gray)
            .cornerRadius(10)
            .pickerStyle(.segmented)
        } else{
            HStack{
                Text("Soring Order: ")
                    .font(.title3.bold())
                    .padding(5)
                    .background(Color.purple)
                    .cornerRadius(5)
                Picker(selection: $sortedValue) {
                    ForEach(sortingAlgo.indices){ index in
                        Text(sortingAlgo[index])
                        //                        .bold()
                        //                        .padding()
                            .font(.title)
                            .foregroundColor(Color.purple)
                            .background(Color.pink)
                            .tag(sortingAlgo[index])
                    }
                } label: {
                    Text("Soring Order:")
                    
                }
                .pickerStyle(.automatic)
                
                Image(systemName: isAcending ? "arrow.down" : "arrow.up")
                    .padding(5)
                    .background(Color.purple)
                    .cornerRadius(5)
                    .onTapGesture {
                        isAcending.toggle()
                        sortNotesFunction()
                    }
            }
            //        .frame(maxWidth: .infinity, alignment: .leading)
            .padding(7)
            .background(Color.gray)
            .cornerRadius(10)
        }
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
            
            //            Spacer()
            if isMacOS(){
                Spacer(minLength: 0)
                
                Text(note.date, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
            }
            
            HStack{
                if !isMacOS(){
                    Text(note.date, style: .date)
                        .foregroundColor(.black)
                        .opacity(0.8)
                }
                
                Spacer(minLength: 0)
                //Edit Button
                Button {
                    editNote = note
                    isEditNoteCall = true
                    isPassword = true
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $isEditNote) {
                    NewOrEditNote(editNote: $editNote, storedNotes: $storedNotes, isEditNote: $isEditNote, rightPassword: $rightPassword)
                        .onDisappear{
                            filteredNotes = storedNotes
                            saveNotes()
                        }
                }
                
                .sheet(isPresented: $isPassword) {
                    PasswordCheckView(editNote: $editNote, isPassword: $isPassword, isEditNote: $isEditNote, isEditNoteCall: $isEditNoteCall, storedNotes: $storedNotes, wrongPassword: $wrongPasswordToast, rightPassword: $rightPassword, noteDeleted: $noteDeleted, noteDeletedToast: $noteDeletedToast)
                        .onAppear{
                            print("isPassword = \(String(isPassword)), isEditNote = \(String(isEditNote)), rightPassword = \(String(rightPassword)), isNewNote = \(String(isNewNote)) ")
                        }
                        .onDisappear{
                            filteredNotes = storedNotes
                            saveNotes()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                                filteredNotes = storedNotes
                                saveNotes()
                                rightPassword = false
                                print("isPassword = \(String(isPassword)), isEditNote = \(String(isEditNote)), rightPassword = \(String(rightPassword)), isNewNote = \(String(isNewNote)) ")
                            }
                        }
                }
                
                Button {
                    editNote = note
                    noteDeleted = true
                    isPassword = true
                    
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                
                Button {
                    editNote = note
                    isEditNoteCall = false
                    isPassword = true
                } label: {
                    if note.password == "" {
                        Image(systemName: "lock.open.fill")
                            .font(.system(size: 15, weight: .bold))
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }else {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 15, weight: .bold))
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.top, isMacOS() ? 5 : 55)
        }
        .padding()
        .background(Color(note.cardColor))
        .cornerRadius(18)
    }
    
    @ViewBuilder
    func SideBar() -> some View {
        VStack{
            if isMacOS(){
                Text("Sticky Notes")
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
                
                ForEach(colors, id: \.self){color in
                    Circle()
                        .fill(Color(color))
                    //                        .fill(color)
                        .frame(width: isMacOS() ? 20 : 25, height: isMacOS() ? 20 : 25)
                        .onTapGesture {
                            editNote = Note(title: "", note: "", date: getSampleDate(offset: 0), cardColor: color, password: "")
                            storedNotes.append(editNote)
                            isNewNote = true
                        }
                        .sheet(isPresented: $isNewNote) {
                            NewOrEditNote(editNote: $editNote, storedNotes: $storedNotes, isEditNote: $isNewNote, rightPassword: $rightPassword)
                                .onDisappear{
                                    filteredNotes = storedNotes
                                    saveNotes()
                                    rightPassword = false
                                    isEditNote = false
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
            print("Encode kar k aagaya and Save ho gaya")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
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
