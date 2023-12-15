//
//  WeatherNowView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

struct WeatherNowView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State private var isLoading = false
    @State private var temporaryCity = ""
    var body: some View {

        VStack{
            HStack{
                Text("Change Location")

                TextField("Enter New Location", text: $temporaryCity)
                    .onSubmit {

                        weatherMapViewModel.city = temporaryCity
                        Task {
                            do {
                                // write code to process user change of location
                                
                                try await weatherMapViewModel.getCoordinatesForCity(cityName: "\(temporaryCity)")
                                
//                                print("NEW LOCATION")
//                                print("\(newLocation)")
//                                print("\(weatherMapViewModel.coordinates?.latitude)")
//                                print("\(weatherMapViewModel.coordinates?.longitude)")
                                
                                let weatherData = try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? Constants.defualtLatitude, lon: weatherMapViewModel.coordinates?.longitude ?? Constants.defualtLongitude)
                                
//                                print("========================================><===========")
                                
                                
                                
                            } catch {
                                print("Error: \(error)")
                                isLoading = false
                            }
                        }
                    }
            }
            .bold()
            .font(.system(size: 20))
            .padding(10)
            .shadow(color: .blue, radius: 10)
            .cornerRadius(10)
            .fixedSize()
            .font(.custom("Arial", size: 26))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(15)
            VStack{
                HStack{
                    Text("Current Location: \(weatherMapViewModel.city)")
                }
                .bold()
                .font(.system(size: 20))
                .padding(10)
                .shadow(color: .blue, radius: 10)
                .cornerRadius(10)
                .fixedSize()
                .font(.custom("Arial", size: 26))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
                let timestamp = TimeInterval(weatherMapViewModel.weatherDataModel?.current.dt ?? 0)
                let formattedDate = DateFormatterUtils.formattedDateTime(from: timestamp)
                Text(formattedDate)
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 1)

                VStack{
                   
                    // Weather Temperature Value
                    if let forecast = weatherMapViewModel.weatherDataModel {
                        Text("Temp: \((Double)(forecast.current.temp), specifier: "%.2f") ºC")
                            .font(.system(size: 25, weight: .medium))
                        
                        Text("Humidity: \((Double)(forecast.current.humidity), specifier: "%.2f") %")
                            .font(.system(size: 25, weight: .medium))
                        
                        Text("Pressure: \((Double)(forecast.current.pressure), specifier: "%.2f") hPa")
                            .font(.system(size: 25, weight: .medium))
                        
                        Text("Wind Speed: \((Double)(forecast.current.windSpeed), specifier: "%.2f") mph")
                            .font(.system(size: 25, weight: .medium))
                    } else {
                        Text("Temp: N/A")
                            .font(.system(size: 25, weight: .medium))
                    }
                    
                }
               
            }//VS2
        }// VS1
    }
}
struct WeatherNowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherNowView()
    }
}


