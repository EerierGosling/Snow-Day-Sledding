//
//  Location List.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI

struct LocationList: View {
    @EnvironmentObject var locationData: LocationData
    var profile:Profile
    @State private var showFavoritesOnly = false
    @State private var filter = Category.all
    @State private var selectedLocation: Location?
    
    @State private var searchText = ""

    
    var filteredLocations: [Location] {
        locationData.locations.filter { location in
                (!showFavoritesOnly || location.isFavorite)
                    && (filter == .all || filter == location.category)
            && (searchText == "" || location.name.contains(searchText) || location.city.contains(searchText) || location.state.contains(searchText))
            }
        }
    
    var title: String {
        let title = filter == .all ? "Locations" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        locationData.locations.firstIndex(where: { $0.id == selectedLocation?.id })
    }
    
    var body: some View {
        
        NavigationStack {
            List(selection: $selectedLocation) {
                ForEach(filteredLocations) { location in
                    NavigationLink {
                        LocationDetail(location:location, profile:profile)
                    } label: {
                        LocationRow(location:location)
                    }
                    .tag(location)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(Category.allCases) { category in
                                Label(category.rawValue, systemImage: category == Category.all ? "globe.americas.fill" : "").tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        }
        .searchable(text: $searchText)
//        .focusedValue(\.selectedLocation, $locationData.locations[index ?? 0])
    }
}


struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        LocationList(profile:UserProfile)
            .environmentObject(LocationData())
    }
}
