//
//  Pluralization.swift
//  Localization Usage
//
//  Created by admin on 8/22/23.
//

import SwiftUI

struct Pluralization: View {
    func findBro(_ count: Int) -> String{
        let localized = NSLocalizedString("overdue", comment: "xxx")
        let formatted = String(format: localized, count)
        return formatted
    }
    
    let unreadCount0 = 0
    let unreadCount1 = 1
    let unreadCount2 = 3
    
    var body: some View {
        VStack{
            Text(findBro(_:unreadCount0))
            Text(findBro(_:unreadCount1))
            Text(findBro(_:unreadCount2))
        }
    }
}

struct Pluralization_Previews: PreviewProvider {
    static var previews: some View {
        Pluralization()
    }
}
