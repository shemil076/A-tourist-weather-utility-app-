//
//  WindDirHelper.swift
//  WeatherAirCwk
//
//  Created by GirishALukka on 28/03/2023.
//

import Foundation

func convertDegToCardinal(deg: Int) -> String {
//    let cardinalDir = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"]
    let cardinalDir = ["North", "North-Northeast", "Northeast", "East-Northeast", "East", "East-Southeast" , "Southeast", "South-Southeast", "South", "South-Southwest", "Southwest", "West-Southwest", "West", "West-Northwest", "Northwest", "North-Northwest"]
    
    return cardinalDir[Int(round(((Double)(deg % 360)) / 22.5).nextDown) + 1]
    
}

