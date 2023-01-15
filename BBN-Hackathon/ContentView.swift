//
//  ContentView.swift
//  BBN-Hackathon
//
//  Created by Sofia Egan on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .profile
    
    enum Tab {
        case profile
        case search
    }
    var body: some View {
        TabView(selection: $selection) {
            ProfileView(profile:UserProfile)
                .environmentObject(LocationData())
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
                .tag(Tab.profile)

            LocationList(profile:UserProfile)
                .environmentObject(LocationData())
                .tabItem {
                    Label("Search Nearby", systemImage: "magnifyingglass.circle.fill")
                }
                .tag(Tab.search)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
