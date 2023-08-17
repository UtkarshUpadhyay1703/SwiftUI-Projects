//
//  ContentView.swift
//  Picker Use
//
//  Created by admin on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String = "1"
    private let filter: [String] = [ "Most Recent", "Most Liked", "Most Watched"]
    @State private var filterValue: String = "Most Liked"
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    
    var body: some View {
        VStack {
            HStack{
                Text("Age = ")
                Text(selection)
            }
            Picker(selection: $selection, label: Text("Picker"), content: {
                ForEach(1..<101){ age in
                    Text("\(age)")
                        .foregroundColor(.red)
                        .tag("\(age)")
                }
            })
                .pickerStyle(.segmented)
            
            HStack{
                Text("Filter = \(filterValue)")
            }
            Picker(selection: $filterValue, label: Text("Picker"), content: {
                ForEach(filter.indices){ index in
                    Text(filter[index])
                        .foregroundColor(.red)
                        .tag(filter[index])
                }
            })
                .pickerStyle(.segmented)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
