//
//  MapView.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: Location
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .near
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region), showsUserLocation: true, annotationItems: [location]) { place in
                MapMarker(coordinate: place.locationCoordinate,
                          tint: Color.red)
            }
    }
    
    var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: location.locationCoordinate,
                span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: LocationData().locations[0])

    }
}
