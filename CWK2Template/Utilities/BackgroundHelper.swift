//
//  BackgroundHelper.swift
//  CWK2Template
//
//  Created by Pramuditha Karunarathna on 2024-01-02.
//

import Foundation
import SwiftUI

struct BackgroundHelper {
    static func setBackground(weatherMapViewModel: WeatherMapViewModel) -> some View {
        guard var mainWeather = weatherMapViewModel.weatherDataModel?.current.weather.first?.main, let weatherIcon = weatherMapViewModel.weatherDataModel?.current.weather.first?.icon else {
            return AnyView(DayAsh()) // Or some other default view
        }
        let dayOrNight = getLastCharacter(imageName: weatherIcon)
        
        
        switch mainWeather {
        case .clear:
            switch dayOrNight {
            case "d" :
                return AnyView(DayClearSky())
            case "n":
                return AnyView(NightClearSky())
            default:
                return AnyView(DayRain())
            }
        case .clouds:
            switch dayOrNight {
            case "d" :
                return AnyView(DayClouds())
            case "n":
                return AnyView(NightClouds())
            default:
                return AnyView(DayRain())
            }
        case .rain:
            switch dayOrNight {
            case "d" :
                return AnyView(DayRain())
            case "n":
                return AnyView(NightRain())
            default:
                return AnyView(DayClearSky())
            }
        case .mist:
            switch dayOrNight {
            case "d" :
                return AnyView(DayMist())
            case "n":
                return AnyView(NightMist())
            default:
                return AnyView(DayClearSky())
            }
        case .smoke:
            switch dayOrNight {
            case "d" :
                return AnyView(DaySmoke())
            case "n":
                return AnyView(NightSmoke())
            default:
                return AnyView(DayClearSky())
            }
        case .haze:
            switch dayOrNight {
            case "d" :
                return AnyView(DayHaze())
            case "n":
                return AnyView(NightHaze())
            default:
                return AnyView(DayClearSky())
            }
        case .dust:
            switch dayOrNight {
            case "d" :
                return AnyView(DayDust())
            case "n":
                return AnyView(NightDust())
            default:
                return AnyView(DayClearSky())
            }
        case .fog:
            switch dayOrNight {
            case "d" :
                return AnyView(DayFog())
            case "n":
                return AnyView(NightFog())
            default:
                return AnyView(DayClearSky())
            }
        case .sand:
            switch dayOrNight {
            case "d" :
                return AnyView(DaySand())
            case "n":
                return AnyView(NightSand())
            default:
                return AnyView(DayClearSky())
            }
        case .ash:
            switch dayOrNight {
            case "d" :
                return AnyView(DayAsh())
            case "n":
                return AnyView(NightAsh())
            default:
                return AnyView(DayClearSky())
            }
        case .squall:
            switch dayOrNight {
            case "d" :
                return AnyView(DaySquall())
            case "n":
                return AnyView(NightSquall())
            default:
                return AnyView(DayClearSky())
            }
        case .tornado:
            switch dayOrNight {
            case "d" :
                return AnyView(DayTornado())
            case "n":
                return AnyView(NightTornado())
            default:
                return AnyView(DayClearSky())
            }
        case .snow:
            switch dayOrNight {
            case "d" :
                return AnyView(DaySnow())
            case "n":
                return AnyView(NightSnow())
            default:
                return AnyView(DayClearSky())
            }
        case .drizzle:
            switch dayOrNight {
            case "d" :
                return AnyView(DayClearSky())
            case "n":
                return AnyView(NightClearSky())
            default:
                return AnyView(DayRain())
            }
        case .thunderstorm:
            switch dayOrNight {
            case "d" :
                return AnyView(DayThunderstorm())
            case "n":
                return AnyView(NightThunderstorm())
            default:
                return AnyView(DayRain())
            }
        }
    }
    
    static func getLastCharacter(imageName: String) -> Character? {
        guard let lastCharacter = imageName.last else {
            return nil
        }
        
        return (lastCharacter == "n" || lastCharacter == "d") ? lastCharacter : nil
    }
    
}
