//
//  WeatherCard.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2023-12-20.
//

import SwiftUI

struct WeatherCard: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    var nameSpace : Namespace.ID
    @Binding var show : Bool
    @Binding var isLoading : Bool
    var body: some View {
        ScrollView{
            if isLoading{
                ProgressView()
            }else{
                VStack{
                    HStack{
                        Image(systemName : "thermometer.medium")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 5)
                            .matchedGeometryEffect(id: "thermometer-icon", in: nameSpace)
                        
                        
                        Text("\((Double)(weatherMapViewModel.weatherDataModel?.current.temp ?? 0), specifier: "%.2f") ºC")
                            .bold()
                            .font(.custom("", size: 60))
                            .padding(.trailing,10)
                            .matchedGeometryEffect(id: "temp", in: nameSpace)
                            .frame(maxWidth: .infinity, alignment:.center)
                    }
                    
                    Spacer()
                    if let forecast = weatherMapViewModel.weatherDataModel {
                        VStack{
                            HStack(alignment: .center, spacing: 20){
                                Image(systemName : "humidity")
                                    .matchedGeometryEffect(id: "Humidity-icon", in: nameSpace)
                                VStack(alignment: .center){
                                    Text("Humidity").font(.title2)
                                        .matchedGeometryEffect(id: "Humidity", in: nameSpace)
                                        
                                    
                                    Text("\((Double)(forecast.current.humidity), specifier: "%.2f") %").font(.headline)
                                        
                                        .matchedGeometryEffect(id: "Humidity-value", in: nameSpace)
                                }
                            }.padding(.bottom, 30)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .background(.ultraThinMaterial)
                                    .overlay(Color.black.opacity(0.4))
                                    .opacity(0.4)
                                    .frame(width: 200, height: UIScreen.main.bounds.height / 10)
                                    .cornerRadius(20)
                                    .matchedGeometryEffect(id: "Humidity-container", in: nameSpace)
                                
                            )
                            Spacer()
                            HStack(alignment: .center, spacing: 20){
                                
                                Image(systemName : "barometer")
                                    .matchedGeometryEffect(id: "barometer-icon", in: nameSpace)
                                VStack(alignment: .center){
                                    Text("Pressure").font(.title2)
                                        .matchedGeometryEffect(id: "Pressure", in: nameSpace)
                                        
                                    
                                    Text("\((Double)(forecast.current.pressure), specifier: "%.2f") hPa").font(.headline)
                                        
                                        .matchedGeometryEffect(id: "Pressure-value", in: nameSpace)
                                }
                            }.padding(.bottom, 30)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .background(.ultraThinMaterial)
                                    .overlay(Color.black.opacity(0.4))
                                    .opacity(0.4)
                                    .frame(width: 200, height: UIScreen.main.bounds.height / 10)
                                    .cornerRadius(20)
                                    .matchedGeometryEffect(id: "Pressure-container", in: nameSpace)
                                
                            )
                            Spacer()
                            HStack(alignment: .center, spacing: 20){
                                Image(systemName : "wind")
                                    .matchedGeometryEffect(id: "wind-icon", in: nameSpace)
                                VStack(alignment: .center){
                                    Text("Wind Speed").font(.title2)
                                        .matchedGeometryEffect(id: "WindSpeed", in: nameSpace)
                                        
                                    
                                    Text("\((Double)(forecast.current.windSpeed), specifier: "%.2f") mph").font(.headline)
                                        
                                        .matchedGeometryEffect(id: "WindSpeed-value", in: nameSpace)
                                }
                            }.padding(.bottom, 30)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .background(.ultraThinMaterial)
                                    .overlay(Color.black.opacity(0.4))
                                    .opacity(0.4)
                                    .frame(width: 200, height: UIScreen.main.bounds.height / 10)
                                    .cornerRadius(20)
                                    .matchedGeometryEffect(id: "windSpeed-container", in: nameSpace)
                                
                            )
                            Spacer()
                            HStack(alignment: .center, spacing: 20){
                                Image(systemName : "eye")
                                    .matchedGeometryEffect(id: "eye-icon", in: nameSpace)
                                VStack(alignment: .center){
                                    Text("Visibility").font(.title2)
                                        .matchedGeometryEffect(id: "visibility", in: nameSpace)
                                        
                                    
                                    Text("\(Int((Double(forecast.current.visibility) / 1000).rounded())) Km").font(.headline)
                                        
                                        .matchedGeometryEffect(id: "visibility-value", in: nameSpace)
                                }
                            }.padding(.bottom, 30)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .background(.ultraThinMaterial)
                                    .overlay(Color.black.opacity(0.4))
                                    .opacity(0.4)
                                    .frame(width: 200, height: UIScreen.main.bounds.height / 10)
                                    .cornerRadius(20)
                                    .matchedGeometryEffect(id: "visibility-container", in: nameSpace)
                                
                            )
                            Spacer()
                        }
                    }
                    
                    
                }.padding(20)
            }
//                .background(
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                        .blur(radius: 30)
//                        .matchedGeometryEffect(id: "blue", in: nameSpace)
//                )
        }.frame(maxHeight: .infinity)

        .foregroundStyle(.white)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).opacity(0.5))
                .matchedGeometryEffect(id: "main-container", in: nameSpace)
        )
        .mask {
            RoundedRectangle(cornerRadius:30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: nameSpace)
        }
        .padding(.bottom,20)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    @Namespace static var nameSpace
    
    static var previews: some View{
        WeatherCard(nameSpace: nameSpace, show: .constant(true), isLoading: .constant(true))
    }
}
