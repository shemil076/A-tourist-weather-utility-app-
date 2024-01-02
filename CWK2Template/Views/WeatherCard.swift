//
//  WeatherCard.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2023-12-20.
//

import SwiftUI

struct WeatherCard: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    var nameSpace : Namespace.ID
    @Binding var show : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            VStack{
                Text("\((Double)(weatherMapViewModel.weatherDataModel?.current.temp ?? 0), specifier: "%.2f") ºC")
                    .bold()
                    .font(.custom("", size: 60))
                    .padding(.trailing,10)
                    .matchedGeometryEffect(id: "temp", in: nameSpace)
                    .frame(maxWidth: .infinity, alignment:.center)
            }.padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blue", in: nameSpace)
                )
        }.frame(height: UIScreen.main.bounds.height / 3)

        .foregroundStyle(.white)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).opacity(0.5))
                .matchedGeometryEffect(id: "blur", in: nameSpace)
        )
        .mask {
            RoundedRectangle(cornerRadius:30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: nameSpace)
        }
        .padding(.bottom,20)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    @Namespace static var nameSpace
    
    static var previews: some View{
        WeatherCard(nameSpace: nameSpace, show: .constant(true))
    }
}
