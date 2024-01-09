//
//  ImageCard.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-06.
//

import SwiftUI

struct ImageCard: View {
    let location: Location
//    var nameSpace : Namespace.ID
    var body: some View {
        VStack{
            Image(String(location.imageNames.first ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                .clipped()
            Text(location.name)
        }
        .padding(20)
        .background(
            Rectangle()
                   .fill(.ultraThinMaterial)
                   .opacity(0.7)
                   .frame(width: UIScreen.main.bounds.width / 2.8 )
                   .cornerRadius(20)
        )
    }
}

//#Preview {
//    ImageCard()
//}
