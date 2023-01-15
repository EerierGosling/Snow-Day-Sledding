//
//  LocationData.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import Foundation
import Combine

final class LocationData: ObservableObject {
    @Published var locations: [Location] = [Location(id: 1, name: "Kingsley Park", city: "Cambridge", state: "MA", xp: 20, gotXP: false, isFavorite: false, category: Category.sledding, coordinates: Location.Coordinates(latitude: 42.382230, longitude: -71.146171)),
        Location(
          id: 2,
          name: "Franklin Elementary School",
          city: "Newton",
          state: "MA",
          xp: 20,
          gotXP: false,
          isFavorite: false,
          category: Category.sledding,
          coordinates: Location.Coordinates(latitude: 40.5865, longitude: -80.0965)
        ),
        Location(
          id: 3,
          name: "Pats Peak",
          city: "Henniker",
          state: "NH",
          xp: 50,
          gotXP: false,
          isFavorite: false,
          category: Category.skiing,
          coordinates: Location.Coordinates(latitude: 43.1640, longitude: -71.7977)
        ),
        Location(
          id: 4,
          name: "Loon",
          city: "Lincoln",
          state: "NH",
          xp: 50,
          gotXP: false,
          isFavorite: false,
          category: Category.skiing,
          coordinates: Location.Coordinates(latitude: 44.0350, longitude: -71.6197)
        ),
        Location(
          id: 5,
          name: "Frog Pond",
          city: "Boston Common",
          state: "MA",
          xp: 40,
          gotXP: false,
          isFavorite: false,
          category: Category.skating,
          coordinates: Location.Coordinates(latitude: 42.3561, longitude: 71.0658423561)
        ),
        Location(
          id: 6,
          name: "BBN Ice Rink",
          city: "Cambridge",
          state: "MA",
          xp: 50,
          gotXP: false,
          isFavorite: false,
          category: Category.skating,
          coordinates: Location.Coordinates(latitude: 42.373057895650646, longitude: -71.13565617468021)
        ),
        Location(
          id: 7,
          name: "Winter Pond",
          city: "Winchester",
          state: "MA",
          xp: 30,
          gotXP: false,
          isFavorite: false,
          category: Category.skating,
          coordinates: Location.Coordinates(latitude:42.45615, longitude: -71.15337)
        )
      ]

 //load("locationData.json")
    
    @Published var profile = UserProfile
    
    var categories: [String: [Location]] {
        Dictionary(
            grouping: locations,
            by: { $0.category.rawValue }
        )
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
