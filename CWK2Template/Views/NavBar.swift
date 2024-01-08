//
//  NavBar.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

struct NavBar: View {
    init() {
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.95) // Semi-transparent background

        // Style for normal state
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        // Style for selected state
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue
        ]

        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some View {
        TabView {
            WeatherNowView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("City")
                }
                .tag(0)

            WeatherForecastView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Forecast")
                }
                .tag(1)

            TouristPlacesMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Place Map")
                }
                .tag(2)
        }
        .accentColor(.blue) // Change the accent color for the selected tab
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
