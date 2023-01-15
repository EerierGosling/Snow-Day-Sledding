//
//  Category.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import Foundation

enum Category: String, CaseIterable, Identifiable, Codable {
    case all = "All"
    case sledding = "Sledding"
    case skating = "Skating"
    case skiing = "Skiing"
    case other = "Other"
    
    var id: Category { self }
}
