//
//  File.swift
//  
//
//  Created by Phil Yates on 01/09/2021.
//

import Foundation
import Combine

public enum WeatherSummary {
    case clear
    case clouds
    case snow
    case rain
    case drizzle
    case thunderstorm
}

public enum TempFormat {
    case imperial
    case metric
}

public struct HourlyForecastSummary {
    public let location: String
    public let forecast: [HourlyForecast]
}

public struct HourlyForecast {
    public let date: Date
    public let summary: WeatherSummary
    public let temp: Int
    public let tempFormat: TempFormat
}

public struct GPSLocation {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public protocol GetHourlyForecastUseCase {
    func invoke(location: GPSLocation) -> AnyPublisher<HourlyForecastSummary, Error>
}
