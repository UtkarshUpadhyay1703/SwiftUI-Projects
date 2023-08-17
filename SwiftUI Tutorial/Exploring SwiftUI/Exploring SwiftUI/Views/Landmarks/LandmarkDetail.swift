//
//  LandmarkDetail.swift
//  Exploring SwiftUI
//
//  Created by admin on 7/13/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        VStack(alignment: .center) {
//            MapView(coordinate: landmark.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(width: 410, height: 800, alignment: .center)
//
//            CircleImage(image: landmark.image)
//                .offset(y: -100)
//                .padding(.bottom, -100)
            
//            Text("Keoladeo National Park")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//            HStack {
//                Text("Bharatpur Bird Sanctuary")
//                    .font(.subheadline)
//                Spacer()
//                Text("Rajasthan")
//                    .font(.subheadline)
//                Spacer()
//            }
//            .font(.subheadline)
//            .foregroundColor(.secondary)
//            Divider()
//            Text("About Bird Sanctuary")
//                .font(.title2)
//            Text("Home of over 350 species of migratory birds")
//            Spacer(minLength: 100)
//        }
//        .ignoresSafeArea()
//        .padding()
//    }
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack{
                Text(landmark.name)
                    .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    
//    static var landmarks = ModalData().landmarks
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[3])
            .environmentObject(modelData)
    }
}
