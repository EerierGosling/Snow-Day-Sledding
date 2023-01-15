//
//  LocationDetailInfo.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/14/23.
//

import SwiftUI

struct LocationDetailInfo: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var locationData: LocationData
    @StateObject var manager = LocationManager()
    var location:Location
    var profile: Profile
    
    var locationIndex: Int {
        locationData.locations.firstIndex(where: { $0.id == location.id })!
    }
    
    var body: some View {
        VStack {
                location.image
                    .resizable()
                    .frame(height: 200)
                    .clipped()
            .ignoresSafeArea(edges:.top)
        
            VStack(alignment: .leading) {
                HStack {
                    Text(location.name)
                        .font(.title)
                    Spacer()
                    
                    FavoriteButton(isSet: $locationData.locations[locationIndex].isFavorite)
                }
                HStack {
                    Text(location.city)
                    Spacer()
                    Text(location.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("Worth \(location.xp) xp!")
                    .font(.title2)
                Text("Your level would be:")
                    .font(.title3)
                    .padding(.bottom, 10)
                ZStack {
                    VStack {
                        HStack {
                            Text("Level: \(profile.level)")
                            Spacer()
                            Text("XP: \(profile.xp+location.xp)/\(profile.level*100)")
                        }
                        ProgressView(value: Float(profile.xp)/Float((profile.level*100)))
                    }
                    VStack {
                        HStack {
                            Text(" ")
                        }
                        .opacity(0)
                        ProgressView(value: Float(profile.xp+location.xp)/Float((profile.level*100)))
                    }
                        .opacity(0.3)
                }
                HStack {
                    Spacer()
                    Button {
                        locationData.locations[locationIndex].gotXP = CheckDistance(userCoordinates: manager.region.center, destinationCoordinates: location.locationCoordinate, locationXP: location.xp)

                    } label: {
                        Label("I'm Here!", systemImage: "pin.fill")
                            .labelStyle(.titleAndIcon)
                            .padding()
                            .background(colorScheme == .light ? .white : .secondary)
                            .cornerRadius(20)
                            .shadow(color: .secondary, radius:5)
                        
                    }
                    .disabled(!CheckDistance(userCoordinates: manager.region.center, destinationCoordinates: location.locationCoordinate, locationXP: location.xp) || location.gotXP)
                    .padding()
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LocationDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailInfo(location:LocationData().locations[0], profile: UserProfile)
            .environmentObject(LocationData())
    }
}
