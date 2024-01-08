////
////  NetworkMonitor.swift
////  CWK2Template
////
////  Created by Pramuditha Karunarathna on 2024-01-08.
////
//
//import Foundation
//import Network
//
//class NetworkMonitor: ObservableObject {
//    // An instance of NWPathMonitor to monitor network paths
//    let monitor = NWPathMonitor()
//    //vars to track network connectivity and data loading status
//    @Published var isConnected = false
//    @Published var dataLoaded = false
//    
//    init() {
//        monitor.pathUpdateHandler = { [weak self] path in
//            guard let self = self else { return }
//            // Dispatch to the main queue for UI updates
//            DispatchQueue.main.async {
//                self.isConnected = path.status == .satisfied
//            }
//        }
//        // Start monitoring network paths on a background queue
//        monitor.start(queue: DispatchQueue.global(qos: .background))
//    }
//    
//    func loadData() async {
//            print("Loading data...")
//        // Using the WeatherMapViewModel to perform asynchronous data loading tasks
//        do {
//            try await WeatherMapViewModel().getCoordinatesForCity(cityName: "London")
//            // Load data using the default values
//            _ = try await WeatherMapViewModel().loadData(lat:WeatherMapViewModel().coordinates?.latitude ?? Constants.defualtLatitude, lon: WeatherMapViewModel().coordinates?.longitude ?? Constants.defualtLongitude)
//            print("===>> Current")
//        } catch {
//            print("Error: \(error)")
//        }
//            // Simulate loading data after a delay
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.dataLoaded = true
//            }
//        }
//}
