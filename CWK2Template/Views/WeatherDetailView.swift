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
                let skyType =  String(forecast.current.weather[0].weatherDescription.rawValue).capitalized
                let windDirection = convertDegToCardinal(deg: forecast.current.windDeg)
                
                let sunRiseUnixTime = weatherMapViewModel.weatherDataModel?.current.sunrise ?? 0
                let sunSetUnixTime = weatherMapViewModel.weatherDataModel?.current.sunset ?? 0
                let currentTimeZone = weatherMapViewModel.weatherDataModel?.timezone ?? ""
                
                
            
                
                let sunRise = DateFormatterUtils.getLocalTime(from: TimeInterval(sunRiseUnixTime), timezoneIdentifier: currentTimeZone,onlyDate: false)
                let sunSet = DateFormatterUtils.getLocalTime(from: TimeInterval(sunSetUnixTime), timezoneIdentifier: currentTimeZone,onlyDate: false)
                
                let currentUnixTime = weatherMapViewModel.weatherDataModel?.current.dt ?? 0
                let formatedDate = DateFormatterUtils.getLocalTime(from: TimeInterval(currentUnixTime), timezoneIdentifier: currentTimeZone,onlyDate: true)
                
                let currentLatitude =  weatherMapViewModel.coordinates?.latitude ?? 0
                let currentLongitude =  weatherMapViewModel.coordinates?.longitude ?? 0
                
                

                VStack{
                    Spacer()
                    
                    
                    
                    VStack{
                        Text("\((weatherMapViewModel.city).uppercased())")
                            .bold()
                            .font(.custom("", size: 40))
                            .padding(.trailing,10)
                            .matchedGeometryEffect(id: "temp", in: nameSpace)
                            .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                        
                        HStack{

                            
                            Text("Lat: \((Double)(currentLatitude), specifier: "%.2f") º").font(.headline)
                            Text("Lon: \((Double)(currentLongitude), specifier: "%.2f") º").font(.headline)
                        }
                        
                        Text("\((Double)(weatherMapViewModel.weatherDataModel?.current.temp ?? 0), specifier: "%.2f") ºC")
                            .bold()
                            .font(.title3)
                        
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(forecast.current.weather[0].icon)@2x.png"))
                            .matchedGeometryEffect(id: "thermometer-icon", in: nameSpace)
                            .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                        
                        Text(skyType).font(.headline)
                        
                        Text(formatedDate).font(.headline)
                        
                        
                        
                        
                        
                        
                    }.padding(30)
                        .padding()
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .opacity(0.6)
                                .frame(width: UIScreen.main.bounds.width / 1.1)
                                .cornerRadius(10)
                        )
                    
                    Spacer()
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "humidity")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "Humidity-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Humidity").font(.title2)
                                .matchedGeometryEffect(id: "Humidity", in: nameSpace)
                            
                            
                            Text("\((Double)(forecast.current.humidity), specifier: "%.2f") %").font(.headline)
                            
                                .matchedGeometryEffect(id: "Humidity-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "Humidity-container", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "barometer")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "barometer-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Pressure").font(.title2)
                                .matchedGeometryEffect(id: "Pressure", in: nameSpace)
                            
                            
                            Text("\((Double)(forecast.current.pressure), specifier: "%.2f") hPa").font(.headline)
                            
                                .matchedGeometryEffect(id: "Pressure-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "Pressure-container", in: nameSpace))
                        
                    }.padding()
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "wind")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "wind-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Wind Speed").font(.title2)
                                .matchedGeometryEffect(id: "WindSpeed", in: nameSpace)
                            
                            
                            Text("\((Double)(forecast.current.windSpeed), specifier: "%.2f") mph").font(.headline)
                            
                                .matchedGeometryEffect(id: "WindSpeed-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "windSpeed-container", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "eye")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "eye-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Visibility").font(.title2)
                                .matchedGeometryEffect(id: "visibility", in: nameSpace)
                            
                            
                            Text("\(Int((Double(forecast.current.visibility) / 1000).rounded())) Km").font(.headline)
                                .matchedGeometryEffect(id: "visibility-value", in: nameSpace)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "visibility-container", in: nameSpace))
                        
                    }.padding()
                    
                
                    HStack{
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "safari")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "safari-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Wind Direction").font(.title2)
                                .matchedGeometryEffect(id: "WindDirection", in: nameSpace)
                            
                            
                            Text("\(windDirection)").font(.headline)
                            
                                .matchedGeometryEffect(id: "WindDirection-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "windDirection-container", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "sun.max")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "sun-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("UV Index").font(.title2)
                                .matchedGeometryEffect(id: "uvi", in: nameSpace)
                            
                            
                            Text("\((Double)(forecast.current.uvi), specifier: "%.2f")").font(.headline)
                                .matchedGeometryEffect(id: "uvi-value", in: nameSpace)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "uvi-container", in: nameSpace))
                        
                    }.padding()
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "sunrise")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "sunrise-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Sunrise").font(.title2)
                                .matchedGeometryEffect(id: "sunrise", in: nameSpace)
                            
                            
                            Text("\(sunRise)").font(.headline)
                            
                                .matchedGeometryEffect(id: "sunrise-value", in: nameSpace)
                        }.frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "sunrise-container", in: nameSpace))
                        
                        Spacer()
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Image(systemName : "sunset")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width / 7)
                                    .matchedGeometryEffect(id: "sunset-icon", in: nameSpace)
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            Text("Sunset").font(.title2)
                                .matchedGeometryEffect(id: "Sunset", in: nameSpace)
                            
                            
                            Text("\(sunSet)").font(.headline)
                                .matchedGeometryEffect(id: "Sunset-value", in: nameSpace)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 7)
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "Sunset-container", in: nameSpace))
                        
                    }.padding()
                }
                
            }
            
        }.frame(maxWidth: UIScreen.main.bounds.width , maxHeight: UIScreen.main.bounds.height)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).opacity(0.5))
                    .matchedGeometryEffect(id: "main-container", in: nameSpace)
            )
        
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    
    static var previews: some View{
        WeatherDetailView(nameSpace: nameSpace, show: .constant(true))
    }
}
