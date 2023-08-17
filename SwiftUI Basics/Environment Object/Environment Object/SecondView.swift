//
//  SecondView.swift
//  Environment Object
//
//  Created by admin on 7/17/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var account: Account
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Stepper("Balance = \(account.balance)", value: $account.balance)
            NavigationLink("Way to third view", destination: ThirdView())
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
