//
//  CheckDistance.swift
//  BBN-Hackathon
//
//  Created by Sofia Egan on 1/14/23.
//

import Foundation
import CoreLocation

func CheckDistance(userCoordinates: CLLocationCoordinate2D, destinationCoordinates:CLLocationCoordinate2D, locationXP: Int) -> Bool {
    if abs(userCoordinates.latitude - destinationCoordinates.latitude) < 0.0005 && abs(userCoordinates.longitude - destinationCoordinates.longitude) < 0.0005 {
        CheckLevel(locationXP: locationXP)
        return true
    }
    else {
        return false
    }
}
