//
//  DailyWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct DailyWeatherView: View {
    var day: Daily
    var body: some View {

        let formattedDate = DateFormatterUtils.formattedDateWithWeekdayAndDay(from: TimeInterval(day.dt))
        
        let skyType =  String(day.weather[0].weatherDescription.rawValue)
        
        let minTemp = String(day.temp.min)
        let maxTemp = String(day.temp.max)
        
        HStack(alignment: .center, spacing:2){
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
                .frame(width: UIScreen.main.bounds.width / 5 ,height: UIScreen.main.bounds.height / 6)
            
            VStack(alignment: .center, spacing: 1){
                Text(skyType)
                    .font(.body) // Customize the font if needed
                    .padding()
                    .foregroundColor(.black)
                
                Text(formattedDate)
                    .font(.body) // Customize the font if needed
                    .padding()
                    .foregroundColor(.black)

            }
            
            Text("\((Double)(maxTemp) ?? 0, specifier: "%.2f") ºC / \((Double)(minTemp) ?? 0, specifier: "%.2f") ºC")
                .font(.body) // Customize the font if needed
                .padding()
                .foregroundColor(.black)

        }
        .padding(10)
        .background(
            Rectangle()
                   .fill(.ultraThinMaterial)
                   .opacity(0.45)
                   .frame(width: UIScreen.main.bounds.width / 1 , height: UIScreen.main.bounds.height / 5)
                   .cornerRadius(10)
        )

    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var day = WeatherMapViewModel().weatherDataModel!.daily
    static var previews: some View {
        DailyWeatherView(day: day[0])
    }
}


