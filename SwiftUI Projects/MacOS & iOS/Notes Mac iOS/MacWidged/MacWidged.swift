//
//  MacWidged.swift
//  MacWidged
//
//  Created by admin on 11/17/23.
//

import WidgetKit
import SwiftUI
import Intents

//struct Provider: IntentTimelineProvider {
//    @AppStorage("storedNotes") private var storedNotesData: Data?
//    @State var storedNotes: [Note]  = [ ]
//
//    func placeholder(in context: Context) -> SimpleEntry {
////        SimpleEntry(date: Date(), notes: getAllNotes(), configuration: ConfigurationIntent())
//        SimpleEntry(date: Date(), notes: getAllNotes())
//    }
//
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
////        let entry = SimpleEntry(date: Date(), notes: getAllNotes(), configuration: configuration)
//        let entry = SimpleEntry(date: Date(), notes: getAllNotes())
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
////            let entry = SimpleEntry(date: entryDate,notes: getAllNotes(), configuration: configuration)
//            let entry = SimpleEntry(date: entryDate,notes: getAllNotes())
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//
//        private func getAllNotes() -> [Note] {
//            if let data = UserDefaults.standard.data(forKey: "storedNotes"){
//                if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data){
//                    return decodedNotes
//                }else {
//                    print("Error in decoding the notes")
//                    return [Note(id: "cat", title: "Cat", note: "Best animal", date: getSampleDate(offset: 2), cardColor: "yellow", password: "")]
//                }
//            }else {
//                print("Error in fetching the notes from UserDefaults the notes")
//                return [Note(id: "train", title: "Train", note: "Best way o transportation", date: getSampleDate(offset: 5), cardColor: "green", password: "")]
//            }
//        }
//
//
//
//
//
//
//
////    private func getAllNotes() -> [Note] {
////        let defaults = UserDefaults(suiteName: "group.com.faronics.Notes-Mac-iOS.IOSWidged")
////        let data = defaults?.data(forKey: "storedNotes") ?? Data()
////        if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
////            print("Decoded Notes: \(decodedNotes)")
////            return decodedNotes
////        }
////        else {
////            print("Error in fetching the notes from UserDefaults the notes")
////            return [Note(id: "train", title: "Train", note: "Best way o transportation", date: getSampleDate(offset: 5), cardColor: "green", password: "")]
////        }
////    }
//}


struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), notes: getAllNotes())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), notes: getAllNotes())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, notes: getAllNotes())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
//            private func getAllNotes() -> [Note] {
//                if let data = UserDefaults.standard.data(forKey: "storedNotes"){
//                    if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data){
//                        return decodedNotes
//                    }else {
//                        print("Error in decoding the notes")
//                        return [Note(id: "cat", title: "Cat", note: "Best animal", date: getSampleDate(offset: 2), cardColor: "yellow", password: "")]
//                    }
//                }else {
//                    print("Error in fetching the notes from UserDefaults the notes")
//                    return [Note(id: "train", title: "Train", note: "Best way o transportation", date: getSampleDate(offset: 5), cardColor: "green", password: "")]
//                }
//            }
    
    
    private func getAllNotes() -> [Note] {
        let defaults = UserDefaults(suiteName: "group.com.faronics.Notes-Mac-iOS.MacWidged")
        let data = defaults?.data(forKey: "storedNotes") ?? Data()
        if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
            print("Decoded Notes: \(decodedNotes)")
            return decodedNotes
        }
        else {
            print("data is not decoded successfully")
            return notes
        }
    }
}




struct SimpleEntry: TimelineEntry {
    let date: Date
    let notes: [Note]
//    let configuration: ConfigurationIntent
}

struct MacWidgedEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack{
            //            ScrollView(.vertical, showsIndicators: false){
            //                VStack{
            ForEach(entry.notes){ note in
                Text(note.title)
            }
            //                }
            //            }
        }
        .onAppear{
            print(entry.notes.count)
        }
    }
}

@main
struct MacWidged: Widget {
    let kind: String = "MacWidged"
    
//    var body: some WidgetConfiguration {
//        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
//            MacWidgedEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MacWidgedEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MacWidged_Previews: PreviewProvider {
    static var previews: some View {
//        MacWidgedEntryView(entry: SimpleEntry(date: Date(), notes: notes, configuration: ConfigurationIntent()))
        MacWidgedEntryView(entry: SimpleEntry(date: Date(), notes: notes))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
    }
}
