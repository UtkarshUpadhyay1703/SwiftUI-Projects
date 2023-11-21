
//  IOSWidged.swift
//  IOSWidged
//
//  Created by admin on 11/20/23.
//

import WidgetKit
import SwiftUI

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
    
    private func getAllNotes() -> [Note] {
        let defaults = UserDefaults(suiteName: "group.com.faronics.Notes-Mac-iOS.IOSWidged")
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
    var notes: [Note]
}

struct IOSWidgedEntryView : View {
    @State var entry: Provider.Entry
    
    var body: some View {
        VStack{
            //            ScrollView {
            ForEach(entry.notes, id: \.id) { note in
                    Text(note.title)
                        .bold()
                        .foregroundColor(Color.black)
                        .padding(6)
                        .background(Color.pink)
                        .border(.brown, width: 2)
                        .cornerRadius(5)
            }
            .padding(0.5)
        }
        .onAppear {
            var index: Int = 0
            while(index < entry.notes.count){
                print(entry.notes[index].title)
                index+=1
            }
        }
    }
}

@main
struct IOSWidged: Widget {
    let kind: String = "IOSWidged"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            IOSWidgedEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct IOSWidged_Previews: PreviewProvider {
    static var previews: some View {
        IOSWidgedEntryView(entry: SimpleEntry(date: Date(), notes: notes))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
