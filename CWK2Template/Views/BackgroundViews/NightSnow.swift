//
//  NightSnow.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-02.
//

import SwiftUI

struct NightSnow: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        ZStack{
                            Image("halo").resizable()
                                .scaledToFill()
                                .frame(width: 450, height: 350)
                                .opacity(0.8)
                            
                            Image("moon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .opacity(0.4)
                            
                        }
                        Image("cloud5")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.9)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        Image("WideCloud")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.6)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        Image("cloud3")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.6)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        
                        VStack{
                            Image("cloud7")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.9)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                            
                            Image("cloud4")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.8)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                        
                    }.padding()
                }.ignoresSafeArea()
                
//                ZStack{
//                    
//                    Image("cloud4")
//                        .resizable()
//                        .scaledToFill()
//                        .opacity(0.8)
//                        .frame(width: 500, height: 200)
//                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
//                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
//                    
//                    Image("WideCloud")
//                        .resizable()
//                        .scaledToFill()
//                        .opacity(0.8)
//                        .frame(width: 500, height: 200)
//                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
//                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
//                }
                
                Spacer()
            }.ignoresSafeArea()

        }.background(
            Image("nightSnow")
                .resizable()
                .opacity(0.7)
                .background(Color.black).opacity(1)
                .ignoresSafeArea()
        )
        .onAppear{
            moveCloud1 = true
        }
        
    }
}

#Preview {
    NightSnow()
}
