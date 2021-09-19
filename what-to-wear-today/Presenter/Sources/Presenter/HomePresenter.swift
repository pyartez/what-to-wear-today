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
    private let refreshSubject: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    private let errorSubject: CurrentValueSubject<HomeScreenState, Never> = CurrentValueSubject<HomeScreenState, Never>(.error)
    
    init(getCurrentLocationUseCase: GetCurrentLocationUseCase, getHourlyForecastUseCase: GetHourlyForecastUseCase) {
        self.getCurrentLocationUseCase = getCurrentLocationUseCase
        self.getHourlyForecastUseCase = getHourlyForecastUseCase
    }

    public var state: AnyPublisher<HomeScreenState, Never> {
        return self.refreshSubject.map ({
            return self.getCurrentLocationUseCase.invoke()
        })
        .switchToLatest()
        .map { gpsLocation in
            return self.getHourlyForecastUseCase.invoke(location: gpsLocation)
        }
        .switchToLatest()
        .map { summary in
            return HomeScreenState.ready(HomeScreenViewModel(summary: summary))
        }
        .prepend(.loading)
        .catch({ (error) in
            return self.errorSubject
        })
        .eraseToAnyPublisher()
    }

    public func start() {
        self.refreshSubject.send(())
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
