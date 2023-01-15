//
//  Location.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Location: Hashable, Identifiable, Codable {
    var id: Int
    var name: String
    var city: String
    var state: String
    
    var xp: Int
    var gotXP: Bool
    
    var isFavorite: Bool
    
    var category: Category

    var image:Image {
        Image(name)
    }

    var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

var testLocation = Location(id:1, name: "Kingsley Park", city: "Cambridge", state: "MA", xp: 50, gotXP: false, isFavorite: true, category: Category.sledding, coordinates: Location.Coordinates(latitude: 37.746462, longitude: -122.461695))
