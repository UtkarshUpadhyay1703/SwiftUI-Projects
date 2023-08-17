//
//  Child Toggle.swift
//  Binding property Use
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ChildToggle: View {
    
//    @State private var isOn: Bool = false
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Toggle(isOn: $isOn, label: {
                Text("Press to change colour")
            })
        }
        
    }
}

struct Child_Toggle_Previews: PreviewProvider {
    static var previews: some View {
        ChildToggle(isOn: .constant(false))
    }
}
