
//
//  WeatherForcastView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

struct WeatherForecastView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 16) {
                    if let hourlyData = weatherMapViewModel.weatherDataModel?.hourly {
                        
                        VStack{
                            
                            Label {
                                Text("HOURLY FORECAST")
                                    .font(.subheadline)
                                    .bold()
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            } icon: {
                                Image(systemName: "hourglass")
                                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                            }
                            .padding(.top,10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 20) {
                                    
                                    ForEach(hourlyData) { hour in
                                        HourWeatherView(current: hour)
                                        
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }.padding(.bottom , 10)
                        .frame(width: UIScreen.main.bounds.width / 1.04)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .opacity(0.7)
                                    .frame(width: UIScreen.main.bounds.width / 1.04)
                                    .cornerRadius(10)
                                
                                
                            )
                    }
                    Divider()
                    Spacer()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .padding(.top,20)
                    
                    VStack{
                        
                        Label {
                            Text("8-DAY FORECAST")
                                .font(.subheadline)
                                .bold()
                                .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                                .foregroundColor(.white)
                        } icon: {
                            Image(systemName: "calendar").foregroundColor(.white)
                                .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                        }.padding(.top,10)
                       
                        ScrollView {
                            
                            VStack{
                                ForEach(weatherMapViewModel.weatherDataModel?.daily ?? []) { day in
                                    DailyWeatherView(day: day)
                                }
                            }.padding(20)
                                .padding(.vertical, 16)
                                .padding(.bottom, 30)
                            
                        }
                    } .frame(width: UIScreen.main.bounds.width / 1.04 , height: UIScreen.main.bounds.height/2)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .background(.ultraThinMaterial)
                                .overlay(Color.black.opacity(0.4))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 1.04)
                                .cornerRadius(10)
                        )
                    
                }
                .padding(16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sun.min.fill").foregroundColor(.gray)
            
                        VStack{
                            Text("Weather Forecast for \(weatherMapViewModel.city)").font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)

                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel)
            )
        
        }

    }
}

struct WeatherForcastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
    }
}
