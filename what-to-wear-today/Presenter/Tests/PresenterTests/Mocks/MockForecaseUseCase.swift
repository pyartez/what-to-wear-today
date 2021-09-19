//
//  File.swift
//  
//
//  Created by Phil Yates on 17/09/2021.
//

import UseCaseAbstraction
import Combine

enum ForeCastError: Error {
    case noForecast
}

struct MockForecaseUseCaseError: GetHourlyForecastUseCase {
    func invoke(location: GPSLocation) -> AnyPublisher<HourlyForecastSummary, Error> {
        return Fail<HourlyForecastSummary, Error>(error: ForeCastError.noForecast).eraseToAnyPublisher()
    }
}
