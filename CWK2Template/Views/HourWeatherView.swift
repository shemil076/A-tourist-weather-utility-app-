//
//  HourWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct HourWeatherView: View {
    var current: Current
    var nameSpace : Namespace.ID

    var body: some View {
        let formattedDate = DateFormatterUtils.formattedDateWithWeekdayAndDay(from: TimeInterval(current.dt))
        let formattedTime = DateFormatterUtils.formattedDate12Hour(from: TimeInterval(current.dt))
        let temp = String(current.temp)
        let skyType =  String(current.weather[0].weatherDescription.rawValue.capitalized)
        
        VStack(alignment: .center, spacing: 5) {
            Text(formattedDate)
                .font(.body)

                .padding(.horizontal)
//                .background(Color.white)
                .foregroundColor(.white)
            
            Text(formattedTime)
                .font(.body)

                .padding(.horizontal)
//                .background(Color.white)
                .foregroundColor(.white)

            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
            
            Text("\((Double)(temp) ?? 0, specifier: "%.2f") ºC")
                .font(.body)
                .padding(.horizontal)
//                .background(Color.white)
                .foregroundColor(.white)
            
            Text(skyType)
                .font(.body)

                .padding(.horizontal)
//                .background(Color.white)
                .foregroundColor(.white)

//            Text("Add style & other elements")
//                .frame(width: 125)
//                .font(.body)
//                .multilineTextAlignment(.leading)
//                .lineLimit(nil) 
//                .padding(.horizontal)
//                .background(Color.white)
//                .foregroundColor(.black)
        }
        .padding(.top,30)
        .foregroundColor(.white)
        .background(Blur(style: .systemMaterial).opacity(0.3))
        .cornerRadius(10)
//        background(
//            Rectangle()
//                .fill(.ultraThinMaterial)
//                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)))
        
        
    }
}

//struct HourWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourWeatherView()
//    }
//}


