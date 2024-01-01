//
//  NightFewCloud.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct NightFewCloud: View {
    @State private var moveCloud1 = false
    @State private var moveCloud2 = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 450, height: 350)
                            .opacity(0.6)
                        
                        Image("moon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .opacity(0.4)
                        
                        VStack{
                            Image("cloud5")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.8)
                                .frame(width: 500, height: 200)
                                .offset(x: moveCloud1 ? -100 : 100, y: 0)
                                .animation(Animation.easeInOut(duration: 16).repeatForever(autoreverses: true), value: moveCloud1)
                        }
                    }
                }.padding(.trailing,200)
                    .ignoresSafeArea()
                
                
                Image("WideCloud")
                    .resizable()
                    .scaledToFit()
                    .offset(x: moveCloud2 ? 100 : -100, y: 0)
                    .animation(Animation.easeInOut(duration: 18).repeatForever(autoreverses: true), value: moveCloud2)
                
                Image("cloud3")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .frame(width: 500, height: 200)
                    .offset(x: moveCloud1 ? -100 : 100, y: 0)
                    .animation(Animation.easeInOut(duration: 17).repeatForever(autoreverses: true), value: moveCloud1)
                
                Spacer()
            }.ignoresSafeArea()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear{
            moveCloud1 = true
            moveCloud2 = true
        }
    }
}

#Preview {
    NightFewCloud()
}
