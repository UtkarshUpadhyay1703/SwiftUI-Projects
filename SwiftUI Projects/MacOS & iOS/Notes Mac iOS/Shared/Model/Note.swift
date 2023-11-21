//
//  Note.swift
//  Notes Mac iOS (iOS)
//
//  Created by admin on 10/19/23.
//

import SwiftUI

//Notes Model and Sample Notes
struct Note: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var title: String
    var note: String
    var date: Date
    var cardColor: String
    var password: String
}

//Sample Date
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var notes: [Note] = [
    Note(title: "India's Pride" ,note: "India’s third lunar mission, Chandrayaan – 3 made history on August 23, 2023, by successfully achieving a soft landing on the south pole of the moon. ", date: getSampleDate(offset: 1), cardColor: "Color-Red", password: "123"),
    Note(title: "US and China" ,note: "With this, India became the first nation to land on the moon’s south pole and the fourth (after Russia, the US and China) to land successfully on Earth’s only natural satellite.", date: getSampleDate(offset: -11), cardColor: "Color-Green", password: ""),
    Note(title: "Chandrayaan III" ,note: "In this article, you will learn all you need to know about the Chandrayaan III mission for the UPSC exam. ", date: getSampleDate(offset: 5), cardColor: "Color-Yellow", password: ""),
    Note(title: "India" ,note: "This topic is important for the science and technology segment of the UPSC syllabus.", date: getSampleDate(offset: -5), cardColor: "Color-Blue", password: ""),
    Note(title: "ISRO" ,note: "The Indian Space Research Organisation (ISRO) had undertaken two previous missions to the moon, namely, the Chandrayaan I and the Chandrayaan II. ", date: getSampleDate(offset: 11), cardColor: "Color-Orange", password: "")
]


