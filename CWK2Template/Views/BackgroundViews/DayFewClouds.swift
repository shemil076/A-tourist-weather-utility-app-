//
//  DayFewClouds.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-01.
//

import SwiftUI

struct DayFewClouds: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Image("halo").resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .opacity(0.8)
                        
                        Image("sunGlow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                            .opacity(0.8)
                        
                        VStack{
                            Image("cloud5")
                                .resizable()
                                .scaledToFill()
                        }.padding(.top, 100)
                        
                    }.padding(.trailing,350)
                    Spacer()
                    
                }.ignoresSafeArea()
                Image("cloud1")
                    .resizable()
                    .scaledToFill()
                Spacer()
            }.ignoresSafeArea()
            
        }.background(
            Image("clearDaySky").opacity(0.8)
        )
    }
    }

#Preview {
    DayFewClouds()
}
