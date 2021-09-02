//
//  File.swift
//  
//
//  Created by Phil Yates on 01/09/2021.
//

import Foundation
import Combine

enum WeatherSummary {
    case clear
    case clouds
    case snow
    case rain
    case drizzle
    case thunderstorm
}

enum TempFormat {
    case imperial
    case metric
}

struct HourlyForecastSummary {
    let location: String
    let forecast: [HourlyForecast]
}

struct HourlyForecast {
    let date: Date
    let summary: WeatherSummary
    let temp: Int
    let tempFormat: TempFormat
}

struct GPSLocation {
    let latitude: Double
    let longitude: Double
}

protocol GetHourlyForecastUseCase {
    func invoke(location: GPSLocation) -> AnyPublisher<HourlyForecastSummary, Error>
}
