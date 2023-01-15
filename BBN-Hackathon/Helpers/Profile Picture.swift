//
//  Profile Picture.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI

struct ProfilePicture: View {
    var image:Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(image:Image("DefaultProfilePicture"))
    }
}
