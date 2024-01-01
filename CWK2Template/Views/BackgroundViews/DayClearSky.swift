//
//  DayClearSky.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct DayClearSky: View {
    @State private var moveSun = false
    @State private var moveCloud = false
    var body: some View {
        ZStack{

            VStack{
                HStack{
                    Spacer()
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .opacity(0.8)
                            .padding(.top, 10)
                            .offset(x: moveSun ? -90 : 90, y: moveSun ? -90 : 90)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveSun)
                        
                        Image("sunGlow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                            .opacity(0.8)
                            .padding(.top, 10)
                            .offset(x: moveSun ? -90 : 90, y: moveSun ? -90 : 90)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveSun)
                        
                    }.padding(.trailing,10)
                   
                    
                }.ignoresSafeArea()
                Image("cloud5")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .frame(width: 500, height: 200)
                    .offset(x: moveCloud ? -100 : 100, y: 0)
                    .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud)
                Spacer()
            }.ignoresSafeArea()
            
        }.background(
            Image("clearDaySky")
        )
        .onAppear{
            moveSun = true
            moveCloud = true
        }
    }
}

#Preview {
    DayClearSky()
}
