//
//  Profile.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var image: Image
    var level: Int
    var xp: Int
    
}

var UserProfile = Profile(username:"Test Profile", image: Image("DefaultProfilePicture"), level: 1, xp: 60)
