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
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var showDetailView = false
    @State private var selectedLocation: Location? = nil
    @State var showAlertIfNoImage : Bool = false
    
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
                Spacer()
                VStack{
                    Text("Tourist attractions in \(weatherMapViewModel.city)")
                        .font(.custom("", size: 24)).bold()
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                    ScrollView{
                        HStack{
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(locations.filter { $0.cityName == weatherMapViewModel.city }) { location in
                                    
                                    //                                    ImageCard(location: location)
                                    
                                    ImageCard(location: location)
                                        .onTapGesture {
                                            self.selectedLocation = location
                                            self.showDetailView.toggle()
                                        }
                                    
                                }
                                
                            }.onAppear{
                                checkForEmptyLocations()
                            }.alert(isPresented: $showAlertIfNoImage) {
                                Alert(title: Text("No Images Found"), message: Text("There are no images found with the specified city."), dismissButton: .default(Text("OK")))
                            }
                            .sheet(isPresented: $showDetailView) {
                                
                                if showDetailView, let location = selectedLocation{
                                    MoreImagesView(location: location)
                                }
                                
                                
                                
                            }
                            
                        }
                    }.padding(.top, 20)
                }
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .opacity(0.6)
                        .frame(width: UIScreen.main.bounds.width / 1.1 , height: UIScreen.main.bounds.height / 2.5)
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
    
    private func checkForEmptyLocations() {
        showAlertIfNoImage = locations.filter { $0.cityName == weatherMapViewModel.city }.isEmpty
        
//        print("This is inside the checkForEmptyLocations() ============================>>")
//        locations.forEach(){ location in
//            print("\(location)")
//        }
//        print("===>>>>>>>>>>>>>>>\(newLocations)")
    }
}


struct TouristPlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        TouristPlacesMapView()
    }
}


//                                    VStack{
//                                        Image(String(location.imageNames.first ?? ""))
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
//                                            .clipped()
//                                        Text(location.name)
//                                    }
//                                    .padding(20)
//                                    .background(
//                                        Rectangle()
//                                               .fill(.ultraThinMaterial)
//                                               .opacity(0.7)
//                                               .frame(width: UIScreen.main.bounds.width / 3 , height: UIScreen.main.bounds.height / 3)
//                                               .cornerRadius(20)
//                                    )
