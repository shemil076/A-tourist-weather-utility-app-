
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
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 20) {
                                
                                ForEach(hourlyData) { hour in
                                    HourWeatherView(current: hour)
                                   
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 20)
                        }
                        .frame(height: 200)
                    }
                                        Divider()
                    Spacer()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .padding(.top,20)
                    
                    ScrollView {

                        VStack{
                            ForEach(weatherMapViewModel.weatherDataModel?.daily ?? []) { day in
                                    DailyWeatherView(day: day)
                            }
                        }.padding(20)
                           
                    } .frame(width: UIScreen.main.bounds.width / 1.04 , height: UIScreen.main.bounds.height/3)
                        .background(
                        Rectangle()
                               .fill(.ultraThinMaterial)
                               .opacity(0.45)
                               .frame(width: UIScreen.main.bounds.width / 1.04 , height: UIScreen.main.bounds.height/3)
                               .cornerRadius(10)

                              
                    )
                    
                }
                .padding(16)
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sun.min.fill").foregroundColor(.white)
                        VStack{
                            Text("Weather Forecast for \(weatherMapViewModel.city)").font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel)
//                NightAsh()
            )
            
            //                            .ignoresSafeArea()
        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //
        //        .ignoresSafeArea()
    }
}

struct WeatherForcastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
    }
}
