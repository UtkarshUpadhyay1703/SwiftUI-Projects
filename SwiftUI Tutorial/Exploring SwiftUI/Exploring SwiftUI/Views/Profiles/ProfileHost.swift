//
//  Profiles.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/21/23.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        print("draft value = \(draftProfile) modal data profile = \(modelData.profile)")
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
//            ProfileSummary(profile: draftProfile)
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
//                Text("Profile Editor")
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear(){
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
