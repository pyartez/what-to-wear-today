//
//  File.swift
//  
//
//  Created by Phil Yates on 17/09/2021.
//

import XCTest
import Combine
import UseCaseAbstraction
import PresenterAbstraction
@testable import Presenter

final class UITests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        cancellables = []
    }
    
    func testLocationError() {
        
        let locationUseCase = MockLocationUseCaseError(gpsLocation: nil, error: LocationError.noLocation)
        let foreCastUseCase = MockForecaseUseCaseError()
        
        let presenter = HomePresenterImp(
            getCurrentLocationUseCase: locationUseCase,
            getHourlyForecastUseCase: foreCastUseCase
        )
        
        let expectation = expectation(description: "error received")
        
        presenter.state.sink { completion in
            switch completion {
            case .failure(let error):
                XCTFail("Received unexpected error \(error.localizedDescription)")
            case .finished:
                XCTFail("Publsiher should not complete")
            }
        } receiveValue: { state in
            if case HomeScreenState.error = state {
                expectation.fulfill()
            }
        }.store(in: &cancellables)

        presenter.start()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testForeCastError() {
        let gpsLocation = GPSLocation(latitude: 10.0, longitude: 10.0)
        let locationUseCase = MockLocationUseCaseError(gpsLocation: gpsLocation, error: nil)
        let foreCastUseCase = MockForecaseUseCaseError()
        
        let presenter = HomePresenterImp(
            getCurrentLocationUseCase: locationUseCase,
            getHourlyForecastUseCase: foreCastUseCase
        )
        
        let expectation = expectation(description: "error received")
        
        presenter.state.sink { completion in
            switch completion {
            case .failure(let error):
                XCTFail("Received unexpected error \(error.localizedDescription)")
            case .finished:
                XCTFail("Publsiher should not complete")
            }
        } receiveValue: { state in
            if case HomeScreenState.error = state {
                expectation.fulfill()
            }
        }.store(in: &cancellables)

        presenter.start()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
