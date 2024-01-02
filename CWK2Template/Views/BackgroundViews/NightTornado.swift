//
//  NightTornado.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-02.
//

import SwiftUI

struct NightTornado: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 450, height: 350)
                            .opacity(0.1)
                        
                        Image("moon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .opacity(0.01)
                        Image("cloud3")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.2)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        VStack{
                            Image("cloud4")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.3)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                            
                            Image("cloud3")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.2)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                    }
                }.padding(.trailing,200)
                    .ignoresSafeArea()
                
                
                ZStack{
                    Image("cloud3")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.2)
                        .frame(width: 500, height: 200)
                        .offset(x: moveCloud1 ? -100 : 100, y: 0)
                        .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                    
                    Image("WideCloud")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.2)
                        .offset(x: moveCloud1 ? 100 : -100, y: 0)
                        .animation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true), value: moveCloud1)
                    
                }
                
                
                Spacer()
            }.ignoresSafeArea()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("tornado")
                .resizable()
                .opacity(0.3)
                .scaledToFit()
                .ignoresSafeArea()
                .background(Color.black).opacity(1)
        )
        .onAppear{
            moveCloud1 = true
        }
    }
}

#Preview {
    NightTornado()
}
