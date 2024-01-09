//
//  MoreImagesView.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-06.
//

import SwiftUI

struct MoreImagesView: View {
    let location: Location
    var body: some View {
        ScrollView{
            Text(location.name)
                .font(.largeTitle)
                .bold()
                .padding(.top,20)
            
            ForEach(location.imageNames.indices , id: \.self){ index in
                Image(String(location.imageNames[index]))
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.5 , height: UIScreen.main.bounds.height / 2)
                    .padding(10)
            }
        }.frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height)
    }
}

//#Preview {
//    MoreImagesView()
//}
