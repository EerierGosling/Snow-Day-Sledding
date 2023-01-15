//
//  LocationRow.swift
//  BBN Hackathon
//
//  Created by Sofia Egan on 1/13/23.
//

import SwiftUI

struct LocationRow: View {
    var location: Location
    
    var body: some View {
        HStack {
            location.image
                .resizable()
                .frame(width:100,height:100)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(location.name)
                    .bold()
                Text(location.city)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            if location.isFavorite {
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}


struct LocationRow_Previews: PreviewProvider {
    static var previews: some View {
        LocationRow(location: testLocation)
    }
}
