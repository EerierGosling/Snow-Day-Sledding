//
//  XPBar.swift
//  BBN-Hackathon
//
//  Created by Sofia Egan on 1/14/23.
//

import SwiftUI

struct xpBar: View {
    var level: Int
    var xp: Int
    var body: some View {
        VStack {
            HStack {
                Text("Level: \(level)")
                Spacer()
                Text("XP: \(xp)/\(level*100)")
            }
            ProgressView(value: Float(xp)/Float((level*100)))
        }
    }
}

struct xpBar_Previews: PreviewProvider {
    static var previews: some View {
        xpBar(level: 2, xp: 190)
    }
}
