//
//  ThirdView.swift
//  Environment Object
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var user: Person
    @EnvironmentObject var account: Account
    
    var body: some View {
        Text("Hello, World! \(user.name) with account balance = \(account.balance)")
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(Person())
            .environmentObject(Account())
    }
}
