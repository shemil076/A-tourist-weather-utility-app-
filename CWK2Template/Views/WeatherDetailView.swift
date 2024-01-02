//
//  WeatherDetailView.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2023-12-20.
//

import SwiftUI

struct WeatherDetailView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    var nameSpace : Namespace.ID
    @Binding var show : Bool
    var body: some View {
        ScrollView {
            Spacer()
            if let forecast = weatherMapViewModel.weatherDataModel {
                let skyType =  String(forecast.current.weather[0].weatherDescription.rawValue)
                VStack{
                    Spacer()
                    
                    
                    Label {
                        Text(skyType)
                    } icon: {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(forecast.current.weather[0].icon)@2x.png"))
                    }
                    Text("\((weatherMapViewModel.city).uppercased())")
                        .bold()
                        .font(.custom("", size: 50))
                        .padding(.trailing,10)
                        .matchedGeometryEffect(id: "temp", in: nameSpace)
//                        .frame(maxWidth:.infinity)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Blur(style: .systemMaterial).opacity(0.3))
                        .cornerRadius(10)
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text("Humidity").font(.title2)
                                .matchedGeometryEffect(id: "Humidity", in: nameSpace)
                                
                            
                            Text("\((Double)(forecast.current.humidity), specifier: "%.2f") %").font(.headline)
                                
                                .matchedGeometryEffect(id: "Humidity-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur1", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Pressure").font(.title2)
                                .matchedGeometryEffect(id: "Pressure", in: nameSpace)
                                
                            
                            Text("\((Double)(forecast.current.pressure), specifier: "%.2f") hPa").font(.headline)
                                
                                .matchedGeometryEffect(id: "Pressure-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur2", in: nameSpace))
                        
                    }.padding()
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text("Wind Speed").font(.title2)
                                .matchedGeometryEffect(id: "WindSpeed", in: nameSpace)
                                
                            
                            Text("\((Double)(forecast.current.windSpeed), specifier: "%.2f") mph").font(.headline)
                                
                                .matchedGeometryEffect(id: "WindSpeed-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur3", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Temperature").font(.title2)
                                .matchedGeometryEffect(id: "Temperature", in: nameSpace)
                                
                            
                            Text("\((Double)(forecast.current.temp), specifier: "%.2f") ºC").font(.headline)
                                .matchedGeometryEffect(id: "Temperature-value", in: nameSpace)
                                
                        }
                        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 8)
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "blur4", in: nameSpace))
                        
                    }.padding()
                }
                
            }
            
        }.frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height)
            .foregroundColor(.white)
            .background(Blur(style: .systemMaterial).opacity(0.3))
            .cornerRadius(10)
            
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    
    static var previews: some View{
        WeatherDetailView(nameSpace: nameSpace, show: .constant(true))
    }
}
