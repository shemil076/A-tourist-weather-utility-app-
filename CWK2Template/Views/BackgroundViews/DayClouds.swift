//
//  DayScatteredClouds.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct DayClouds: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    ZStack{
                        Image("cloud7")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.9)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .opacity(0.4)
                        
                        Image("sunGlow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                            .opacity(0.5)
                        
                        
                        VStack{
                            Image("cloud5")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.9)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                        
                    }.padding()
                }.ignoresSafeArea()
                
                ZStack{
                    
                    Image("cloud4")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                    
                    VStack{
                        Image("WideCloud")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.8)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        Image("cloud3")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.9)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                    }.padding()
                }
                
                Image("cloud3")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .frame(width: 500, height: 200)
                    .offset(x: moveCloud1 ? 100 : -100, y: 0)
                    .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                Spacer()
            }.ignoresSafeArea()
            
        }.background(
            Image("clearDaySky")
                .opacity(0.4)
                .background(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 1))
        )
        .onAppear{
            moveCloud1 = true
        }
        
    }
}

#Preview {
    DayClouds()
}
