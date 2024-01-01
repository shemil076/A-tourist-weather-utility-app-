//
//  DayBrokenClouds.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct DayBrokenClouds: View {
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
                            .opacity(0.5)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        
                        Image("sunGlow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 100)
                            .opacity(0.1)
                        
                        Image("cloud5")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.5)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                        VStack{
                            Image("cloud5")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.5)
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
                        .opacity(0.4)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                    
                    VStack{
                        Image("WideCloud")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.6)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        ZStack{
                            Image("cloud3")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.3)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                            Image("cloud4")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.4)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                            
                            Image("WideCloud")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.4)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 16).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                    }.padding()
                }
                
                ZStack{
                    Image("cloud3")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.4)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? 100 : -100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                    
                    
                    Image("cloud7")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.4)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)



                }
                Spacer()
            }.ignoresSafeArea()
            
        }.background(
            Image("clearDaySky")
                .opacity(0.4)
                .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 1))
        )
        .onAppear{
            moveCloud1 = true
        }
        
    }
}

#Preview {
    DayBrokenClouds()
}
