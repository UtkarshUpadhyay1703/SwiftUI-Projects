//
//  LandmarkList.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/13/23.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modalData: ModelData
    @State private var showFavoriatesOnly = false
    
    var filteredLandmark: [Landmark]{
        modalData.landmarks.filter { landmark in
            (!showFavoriatesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoriatesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmark){
                    landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){ deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//            //            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
//                .previewDisplayName(deviceName)
//        }
        
        LandmarkList()
            .environmentObject(ModelData())
        
    }
}
