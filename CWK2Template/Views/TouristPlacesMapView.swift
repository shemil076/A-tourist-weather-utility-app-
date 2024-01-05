//
//  TouristPlacesMapView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct TouristPlacesMapView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State var locations: [Location] = []
    @State var  mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5216871, longitude: -0.1391574), latitudinalMeters: 600, longitudinalMeters: 600)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                if weatherMapViewModel.coordinates != nil {
                    VStack(spacing: 10){
                        //                        Map(coordinateRegion: $mapRegion, showsUserLocation: true)
                        //                            .edgesIgnoringSafeArea(.all)
                        //                            .frame(height: 300)
                        
                        Map{
                            ForEach(locations.filter { $0.cityName == weatherMapViewModel.city }) { location in
                                Marker(location.name, coordinate: location.coordinates)
                            }
                            
                        }
                        
                        
                        
                        
                        //                        VStack{
                        //                            Text("This is a locally defined map for starter template")
                        //                            Text("A map of the user-entered location should be shown here")
                        //                            Text("Map should also show pins of tourist places")
                        //                                                .multilineTextAlignment(.leading)
                        //                                                    .lineLimit(nil)
                        //                                                    .fixedSize(horizontal: false, vertical: true)
                    }
                    //                    VStack(spacing: 5) {
                    //                        if weatherMapViewModel.coordinates != nil {
                    //                            VStack(spacing: 10){
                    //                                //                        Map(coordinateRegion: $mapRegion, showsUserLocation: true)
                    //                                Map {
                    //                                    ForEach(locations.filter { $0.cityName == weatherMapViewModel.city }) { location in
                    //                                        Marker(location.name, coordinate: location.coordinates)
                    //                                    }
                    //                                }
                    //                                .frame(height: UIScreen.main.bounds.height * 0.5)
                    //                                .cornerRadius(20)
                    //                                .padding()
                    //
                    //                            }
                    //                        }}
                }
                
                Text("Tourist ttraction in \(weatherMapViewModel.city)")
                ScrollView{
                    HStack{
                        VStack {
                            ForEach(locations.filter { $0.cityName == weatherMapViewModel.city }) { location in
                                HStack() {
                                    Image(String(location.imageNames.first ?? ""))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.2)
                                        .clipped()
                                    Text(location.name)
                                }
                            }
                        }.background(
                            Rectangle()
                                   .fill(.ultraThinMaterial)
                                   .opacity(0.45)
                                   .frame(width: UIScreen.main.bounds.width / 1 , height: UIScreen.main.bounds.height / 5)
                                   .cornerRadius(10)
                        )
                    }
                }.padding(.top, 20)
                .background(
                    Rectangle()
                           .fill(.ultraThinMaterial)
                           .opacity(0.45)
                           .frame(width: UIScreen.main.bounds.width / 1 , height: UIScreen.main.bounds.height / 5)
                           .cornerRadius(10)
                )
            }.frame(height:700)
                .padding()
                .background(BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel))
//                .ignoresSafeArea()
        }
        .onAppear {
            // process the loading of tourist places
            locations = weatherMapViewModel.loadLocationsFromJSONFile() ?? []
            print("\(locations[0].name)")
        }
//        .background(BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel))
    }
}


struct TouristPlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        TouristPlacesMapView()
    }
}



