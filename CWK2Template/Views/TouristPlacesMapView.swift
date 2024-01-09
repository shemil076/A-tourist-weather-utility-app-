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
    @State var hasImages : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 5) {
                    if weatherMapViewModel.coordinates != nil {
                        VStack(spacing: 10){

                            
                            Map{
                                ForEach(locations.filter { $0.cityName == weatherMapViewModel.city }) { location in
                                    Marker(location.name, coordinate: location.coordinates)
                                }
                                
                            }
                         
                        }.cornerRadius(10)

                    }
                    Spacer()
                    if !hasImages {
                        VStack( spacing: 10){
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
                                    
                                }

                                
                            }.padding(.top, 20)
                        }.padding(.bottom , 10)
                        .sheet(isPresented: $showDetailView) {
                            
                            if showDetailView, let location = selectedLocation{
                                MoreImagesView(location: location)
                            }
                            
                            
                            
                        }
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .overlay(Color.black.opacity(0.4))
                                .opacity(0.6)
                                .frame(width: UIScreen.main.bounds.width / 1.1)
                                .cornerRadius(10)
                        )
                    }
                    
                }.alert(isPresented: $showAlertIfNoImage) {
                    Alert(
                        title: Text("No Location Found"),
                        message: Text("There are no images and coordinates found with the specified city."),
                        dismissButton: .default(Text("OK"), action: {
                            // This code will be executed when the OK button is pressed
                            hasImages = true
                        })
                    )
                }
                .frame(height:700)
                    .padding()
                    .background(BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel))
                //                .ignoresSafeArea()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "pin.circle").foregroundColor(.gray)
            
                        VStack{
                            Text("Tourist attractions in \(weatherMapViewModel.city)").font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)

                        }
                    }
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(
//                BackgroundHelper.setBackground(weatherMapViewModel: weatherMapViewModel)
//            )
            
        }
        
        .onAppear {
            // process the loading of tourist places
            locations = weatherMapViewModel.loadLocationsFromJSONFile() ?? []
            hasImages = false
            checkForEmptyLocations()
            print("\(locations[0].name)")
            
            print("\(weatherMapViewModel.coordinates)")
        }
       
    }
    
    private func checkForEmptyLocations() {
        showAlertIfNoImage = locations.filter { $0.cityName == weatherMapViewModel.city }.isEmpty
    }
}


struct TouristPlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        TouristPlacesMapView()
    }
}
