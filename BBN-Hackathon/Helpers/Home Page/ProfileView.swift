//
//  Home Screen.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var locationData: LocationData
    
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    var profile:Profile
    
    var body: some View {
        VStack {
            Map(
               coordinateRegion: $manager.region,
               interactionModes: MapInteractionModes.all,
               showsUserLocation: true,
               userTrackingMode: $tracking,
               annotationItems: locationData.locations) { place in
                       MapMarker(coordinate: place.locationCoordinate,
                                 tint: Color.red)
                   }
                .ignoresSafeArea(edges:.top)
                .frame(height:610)
            
            profile.image
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(colorScheme == .light ? .white : .secondary, lineWidth: 4)
                }
                .shadow(color: .secondary, radius:7)
                .scaledToFit()
                .offset(y: -130)
                .padding(.bottom,-130)


            VStack(alignment: .leading) {
                HStack {
                    Text(profile.username)
                        .font(.title)
                        .foregroundColor(.primary)
                    Spacer()
                }
                xpBar(level: profile.level, xp: profile.xp)
            }
                .padding()
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile:UserProfile)
            .environmentObject(LocationData())
    }
}
