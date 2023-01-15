//
//  CheckLevel.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import Foundation

func CheckLevel(locationXP: Int) {
    if UserProfile.xp > UserProfile.level*100 {
        UserProfile.level = UserProfile.level + locationXP
        UserProfile.xp = UserProfile.xp - (UserProfile.level * 100)
    }
}
