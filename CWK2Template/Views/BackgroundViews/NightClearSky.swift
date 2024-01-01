//
//  NightClearSky.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct NightClearSky: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 450, height: 350)
                            .opacity(0.8)
                        
                        Image("moon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .opacity(0.5)
                        
                    }
                }.padding(.leading,50)
                .ignoresSafeArea()
                
                
                Image("WideCloud")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 30)
                    .offset(x: moveCloud1 ? -100 : 100, y: 0)
                    .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                
                Image("cloud3")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .frame(width: 500, height: 200)
                    .offset(x: moveCloud1 ? 100 : -100, y: 0)
                    .animation(Animation.easeInOut(duration: 18).repeatForever(autoreverses: true), value: moveCloud1)
                Spacer()
            }.ignoresSafeArea()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear{
            moveCloud1 = true
        }
    }
}

#Preview {
    NightClearSky()
}
