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
        ZStack{
            
            
            Background()
            
            
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: 40)
                            .overlay(
                                HStack {

                                    TextField("Enter text", text: $temporaryCity)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(.white)

                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 10)


                                }
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
                                                
                                                _ = try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? Constants.defualtLatitude, lon: weatherMapViewModel.coordinates?.longitude ?? Constants.defualtLongitude)
                                                
                //                                print("========================================><===========")
                                                
                                                
                                                
                                            } catch {
                                                print("Error: \(error)")
                                                isLoading = false
                                            }
                                        }
                                    }
                            )
                            .padding()

                Spacer()

                Text("\(weatherMapViewModel.city)")
                    .font(.custom("", size: 40))
                    .foregroundColor(.white)
                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Blur(style: .systemMaterial).opacity(0.3))
                                    .cornerRadius(10)
                                    .padding()

                Spacer()

                ZStack{
                    Image("temp")
                        .resizable()
                        .scaledToFit()

                    HStack{
                        Spacer()
                        
                        if let forecast = weatherMapViewModel.weatherDataModel {
                            Text("\((Double)(forecast.current.temp), specifier: "%.2f") ºC")
                                .bold()
                                .font(.custom("Poppins", size: 60))
                                .foregroundStyle(.white)
                                .padding(.trailing,10)
                        }
                        
                    }


                }.padding(.bottom, 10)

            }.padding()
            
            
            
            VStack{
                HStack{
//                    Text("Change Location")

//                    TextField("Enter New Location", text: $temporaryCity)
//                        .onSubmit {
//
//                            weatherMapViewModel.city = temporaryCity
//                            Task {
//                                do {
//                                    // write code to process user change of location
//                                    
//                                    try await weatherMapViewModel.getCoordinatesForCity(cityName: "\(temporaryCity)")
//                                    
//    //                                print("NEW LOCATION")
//    //                                print("\(newLocation)")
//    //                                print("\(weatherMapViewModel.coordinates?.latitude)")
//    //                                print("\(weatherMapViewModel.coordinates?.longitude)")
//                                    
//                                    _ = try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? Constants.defualtLatitude, lon: weatherMapViewModel.coordinates?.longitude ?? Constants.defualtLongitude)
//                                    
//    //                                print("========================================><===========")
//                                    
//                                    
//                                    
//                                } catch {
//                                    print("Error: \(error)")
//                                    isLoading = false
//                                }
//                            }
//                        }
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
//                VStack{
//                    HStack{
////                        Text("Current Location: \(weatherMapViewModel.city)")
//                    }
//                    .bold()
//                    .font(.system(size: 20))
//                    .padding(10)
//                    .shadow(color: .blue, radius: 10)
//                    .cornerRadius(10)
//                    .fixedSize()
//                    .font(.custom("Arial", size: 26))
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .cornerRadius(15)
//                    let timestamp = TimeInterval(weatherMapViewModel.weatherDataModel?.current.dt ?? 0)
//                    let formattedDate = DateFormatterUtils.formattedDateTime(from: timestamp)
//                    Text(formattedDate)
//                        .padding()
//                        .font(.title)
//                        .foregroundColor(.black)
//                        .shadow(color: .black, radius: 1)
//
//                    VStack{
//                       
//                        // Weather Temperature Value
//                        if let forecast = weatherMapViewModel.weatherDataModel {
//                            
//                            let des =  String(forecast.current.weather[0].weatherDescription.rawValue)
//                            
//    //                        Image(forecast.current.weather[0].icon)
//                            
//                            Label {
//                                Text(des)
//                            } icon: {
//                               AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(forecast.current.weather[0].icon)@2x.png"))
//                            }
//
//
//                            
//                            Text("Temp: \((Double)(forecast.current.temp), specifier: "%.2f") ºC")
//                                .font(.system(size: 25, weight: .medium))
//                                .foregroundColor(.white)
//                            
//                            Text("Humidity: \((Double)(forecast.current.humidity), specifier: "%.2f") %")
//                                .font(.system(size: 25, weight: .medium))
//                                .foregroundColor(.white)
//                            
//                            Text("Pressure: \((Double)(forecast.current.pressure), specifier: "%.2f") hPa")
//                                .font(.system(size: 25, weight: .medium))
//                                .foregroundColor(.white)
//                            
//                            Text("Wind Speed: \((Double)(forecast.current.windSpeed), specifier: "%.2f") mph")
//                                .font(.system(size: 25, weight: .medium))
//                                .foregroundColor(.white)
//                        } else {
//                            Text("Temp: N/A")
//                                .font(.system(size: 25, weight: .medium))
//                                .foregroundColor(.white)
//                        }
//                        
//                    }
//                    .background(Blur(style: .systemMaterial).opacity(5))
//                   
//                }//VS2
            }// VS1
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}
struct WeatherNowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherNowView()
    }
}


struct Blur: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        return visualEffectView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}


