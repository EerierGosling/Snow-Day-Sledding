//
//  LocationDetail.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI
import MapKit

struct LocationDetail: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var locationData: LocationData
    var location:Location
    var profile:Profile
    @State var isPresented: Bool = false
    
    var locationIndex: Int {
        locationData.locations.firstIndex(where: { $0.id == location.id })!
    }
    
    var body: some View {
        ZStack {
            MapView(location: location)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Label("Location Info", systemImage: "info.circle")
                            .labelStyle(.titleAndIcon)
                            .padding()
                            .background(colorScheme == .light ? .white : .secondary)
                            .cornerRadius(20)
                            .shadow(color: .secondary, radius:5)
                        
                    }
                    .padding()
                }
            }
        }
        
        .sheetWithDetents(isPresented: $isPresented, detents: [.medium(),.large()]) {
            print("filler")
                }
            content: {
                LocationDetailInfo(location:location, profile:profile)
                    .environmentObject(LocationData())
                }
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {

        LocationDetail(location:LocationData().locations[0],profile: UserProfile)
            .environmentObject(LocationData())
    }
}
