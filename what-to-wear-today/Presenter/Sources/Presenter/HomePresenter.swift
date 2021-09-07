//
//  File.swift
//  
//
//  Created by Phil Yates on 30/08/2021.
//

import Foundation
import PresenterAbstraction
import Combine
import UseCaseAbstraction

public final class HomePresenterImp: HomePresenter {
    private let getCurrentLocationUseCase: GetCurrentLocationUseCase
    private let getHourlyForecastUseCase: GetHourlyForecastUseCase
    
    init(getCurrentLocationUseCase: GetCurrentLocationUseCase, getHourlyForecastUseCase: GetHourlyForecastUseCase) {
        self.getCurrentLocationUseCase = getCurrentLocationUseCase
        self.getHourlyForecastUseCase = getHourlyForecastUseCase
    }

    public var state: AnyPublisher<HomeScreenState, Error> {
        return self.getCurrentLocationUseCase
            .invoke()
            .map { gpsLocation in
                return self.getHourlyForecastUseCase.invoke(location: gpsLocation)
            }
            .switchToLatest()
            .map { summary in
                return HomeScreenState.ready(HomeScreenViewModel(summary: summary))
            }
            .prepend(.loading)
            .eraseToAnyPublisher()
    }

    public func start() {

    }
}

public extension HomeScreenViewModel {
    init(summary: HourlyForecastSummary) {
        self.init(
            title: summary.location,
            advicons: [],
            hourlyTimeline: []
        )
    }
}
