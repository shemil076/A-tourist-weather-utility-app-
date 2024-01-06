//
//  HourWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct HourWeatherView: View {
    var current: Current
    
    var body: some View {
        let formattedDate = DateFormatterUtils.formattedDateWithWeekdayAndDay(from: TimeInterval(current.dt))
        let formattedTime = DateFormatterUtils.formattedDate12Hour(from: TimeInterval(current.dt))
        let temp = String(current.temp)
        let weatherDescription =  String(current.weather[0].weatherDescription.rawValue.capitalized)
        var words: [String] {
            weatherDescription.components(separatedBy: " ")
        }
        
        VStack(alignment: .center) {
            Text(formattedDate)
                .font(.body)
            
                .padding(.horizontal)
                .foregroundColor(.white)
            
            Text(formattedTime)
                .font(.body)
            
                .padding(.horizontal)
                .foregroundColor(.white)
            
            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
            
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 9 ,height: UIScreen.main.bounds.height / 10)
                .shadow(color: Color.white, radius: 5, x: 0, y: 0)
            
            
            
            Text("\((Double)(temp) ?? 0, specifier: "%.2f") ºC")
                .font(.body)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            VStack{
                ForEach(words, id: \.self){ word in
                    Text(word)
                        .font(.body)
                        .foregroundColor(.white)
                    
                }
            }.padding()
            
        }
        .padding(.horizontal, 20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .background(.ultraThinMaterial)
                .overlay(Color.black.opacity(0.4))
                .opacity(0.4)
                .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 2.5)
                .cornerRadius(20)
            
        )
        
        
    }
}

struct HourWeatherView_Previews: PreviewProvider {
    static var current = WeatherMapViewModel().weatherDataModel!.current
    static var previews: some View {
        HourWeatherView(current: current)
    }
}


