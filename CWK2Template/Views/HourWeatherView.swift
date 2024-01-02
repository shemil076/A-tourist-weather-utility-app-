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
        let skyType =  String(current.weather[0].weatherDescription.rawValue.capitalized)
        
        VStack(alignment: .center, spacing: 5) {
            Text(formattedDate)
                .font(.body)

                .padding(.horizontal)
                .foregroundColor(.white)
            
            Text(formattedTime)
                .font(.body)

                .padding(.horizontal)
                .foregroundColor(.white)

            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
            
            Text("\((Double)(temp) ?? 0, specifier: "%.2f") ºC")
                .font(.body)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            Text(skyType)
                .font(.body)
                .padding(.horizontal)
                .foregroundColor(.white)

        }
        .padding(.top,30)
        .padding(.horizontal,10)
        .background(
            Rectangle()
                   .fill(.ultraThinMaterial)
                   .opacity(0.45)
                   .frame(width: UIScreen.main.bounds.width / 2.5 , height: UIScreen.main.bounds.height / 3.5)
                   .cornerRadius(10)
                   
        )
        
        
    }
}

//struct HourWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourWeatherView()
//    }
//}


