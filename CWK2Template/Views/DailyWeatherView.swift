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
        
        let weatherDescription =  String(day.weather[0].weatherDescription.rawValue.capitalized)
        var words: [String] {
            weatherDescription.components(separatedBy: " ")
        }
        
        VStack(alignment: .center, spacing:2){
            
            
            Text(formattedDate)
                .font(.body) // Customize the font if needed
                .padding()
                .foregroundColor(.black)
            
            
            
            HStack{
                
                VStack{
                    ForEach(words, id: \.self){ word in
                        Text(word)
                            .font(.body)
                            .foregroundColor(.white)
                        
                   
                    }
                }
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
                    .frame(width: UIScreen.main.bounds.width / 6 ,height: UIScreen.main.bounds.height / 67)
                    .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                
                
                
//                Text("\((Double)(maxTemp) ?? 0, specifier: "%.2f") ºC / \((Double)(minTemp) ?? 0, specifier: "%.2f") ºC")
//                    .font(.body) // Customize the font if needed
//                    .padding()
//                    .foregroundColor(.black)
                
                VStack{
                Text("\((Double)(maxTemp) ?? 0, specifier: "%.2f") ºC")
                        .font(.body) // Customize the font if needed
                        .padding()
                        .foregroundColor(.black)
                    Divider()
                    
                    Text("\((Double)(minTemp) ?? 0, specifier: "%.2f") ºC")
                            .font(.body) // Customize the font if needed
                            .padding()
                            .foregroundColor(.black)
                    
                }
                
            }
            
            
            
            
            HStack{
                Image(systemName: "humidity").foregroundColor(.black)
                
                Text("\(day.humidity)")
                
                
                Image(systemName: "wind").foregroundColor(.black)
                
                Text("\(day.windSpeed)")
                
                
//                Label(<#T##title: StringProtocol##StringProtocol#>, systemImage: <#T##String#>)
            }
            
            
            
            
//            VStack(alignment: .center, spacing: 1){
//               
//                
//              
//
//            }
            
            

        }
        .padding(10)
        .background(
            Rectangle()
                   .fill(.ultraThinMaterial)
                   .opacity(0.45)
                   .frame(width: UIScreen.main.bounds.width / 1 , height: UIScreen.main.bounds.height / 4)
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


