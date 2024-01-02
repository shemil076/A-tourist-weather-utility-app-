//
//  NightSmoke.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct NightSmoke: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 450, height: 350)
                            .opacity(0.3)
                        
                        Image("moon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .opacity(0.1)
                        Image("cloud3")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.9)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        VStack{
                            Image("cloud4")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.9)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                            
                            Image("cloud5")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.9)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                    }
                }.padding(.trailing,200)
                    .ignoresSafeArea()
                
                
                ZStack{
                    Image("WideCloud")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                    
                    Image("cloud3")
                        .resizable()
                        .scaledToFit()
                        .offset(x: moveCloud1 ? 100 : -100, y: 0)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                    
                }
                
                ZStack{
                    Image("cloud3")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                    Image("cloud7")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.6)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? 100 : -100, y: 0)
                        .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                }
                
                Spacer()
            }.ignoresSafeArea()
            
            Image("smoke")
                .resizable()
                .opacity(0.2)
                .ignoresSafeArea()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black).opacity(1)
        .onAppear{
            moveCloud1 = true
        }
    }
}

#Preview {
    NightSmoke()
}