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
    
    @Namespace var namespace
    @State var showWeatherDetails = false
    
    var body: some View {
        ZStack{
            VStack{
                if !showWeatherDetails{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(height: 40)
                        .overlay(
                            HStack {
                                
                                TextField("Enter text", text: $temporaryCity)
                                    .padding(.horizontal, 20)
                                    .foregroundColor(.white)
                                    .background(.white.opacity(0.12))
                                    .clipShape(.rect(cornerRadius: 8, style: .continuous))
                                
                                
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
                                            
                                            
                                            _ = try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? Constants.defualtLatitude, lon: weatherMapViewModel.coordinates?.longitude ?? Constants.defualtLongitude)
                                            
                                            print("===>> Current")
                                            print("\(String(describing: weatherMapViewModel.weatherDataModel?.current))")
                                            
                                            
                                            
                                        } catch {
                                            print("Error: \(error)")
                                            isLoading = false
                                        }
                                        
                                    }
                                }
                        )
                        .padding(.top,70)
                }
                VStack{
                    
                    if !showWeatherDetails{
                        VStack{
                            Spacer()
                            
                            
                            Spacer()
                            
                            Text("\(weatherMapViewModel.city)")
                                .font(.custom("", size: 40))
                                .foregroundColor(.white)
                                .font(.title)
                                .background(
                                    Rectangle()
                                        .fill(.ultraThinMaterial)
                                        .opacity(0.5)
                                        .frame(width: UIScreen.main.bounds.width / 2 , height: UIScreen.main.bounds.height / 9)
                                        .cornerRadius(20)
                                )
                            
                            Spacer()
                            
                            let timestamp = TimeInterval(weatherMapViewModel.weatherDataModel?.current.dt ?? 0)
                            let formattedDate = DateFormatterUtils.formattedDateTime(from: timestamp)
                            Text(formattedDate)
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1)

                            
                        }
                    }
                    
                    if !showWeatherDetails {
                        WeatherCard(nameSpace: namespace, show: $showWeatherDetails)
                    }else{
                        WeatherDetailView(nameSpace: namespace, show: $showWeatherDetails)
                    }
                    
                }.padding()
                    .onTapGesture {
                        withAnimation(){
                            showWeatherDetails.toggle()
                        }
                    }
                
            }.padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel)
        )
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


