//
//  NightDrizzle.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-02.
//

import SwiftUI

struct NightDrizzle: View {
    @State private var moveCloud1 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        ZStack{
                            Image("halo").resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .opacity(0.5)
                            
                            Image("moon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .opacity(0.1)
                            
                        }
                        Image("cloud5")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.3)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? 100 : -100, y: 0)
                            .animation(Animation.easeInOut(duration: 19).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        Image("cloud3")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.3)
                            .frame(width: 500, height: 200)
                            .offset(x: moveCloud1 ? -100 : 100, y: 0)
                            .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                        
                        
                        VStack{
                            Image("cloud7")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.3)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? 100 : -100, y: 0)
                                .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                            
                        }
                        
                    }.padding()
                }.ignoresSafeArea()
                
                
                Spacer()
            }.ignoresSafeArea()

        }.background(
            Image("nightDrizzle")
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
    NightDrizzle()
}
