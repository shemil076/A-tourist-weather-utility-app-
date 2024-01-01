//
//  Background.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2023-12-18.
//

import SwiftUI

struct Background: View {
    
    @State private var blurRadius: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack{
            
            VStack{
                Image("Top-Glow")
                Spacer()
            }.ignoresSafeArea()
            VStack{
                HStack {
                    Spacer()
                    Image("Top-right")
                        .padding(.top)
                        .blur(radius: blurRadius)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                                blurRadius = 5
                            }
                        }
                }
                Spacer()
                
            }.ignoresSafeArea()
            
            Spacer()
            Image("Main")
                .scaleEffect(scale)
                .blur(radius: blurRadius)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                    blurRadius = 5
                }
            }
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Image("Bottom-right")
                        .padding(.top)
                        .blur(radius: blurRadius)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                                blurRadius = 5
                            }
                        }
                    
                }
                
            }.ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("Bottom-Glow")
                
            }.ignoresSafeArea()
            
            Spacer()
            
        }

    }
}

#Preview {
    Background()
}
