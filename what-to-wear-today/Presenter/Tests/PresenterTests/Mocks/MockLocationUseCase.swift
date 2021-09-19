//
//  File 2.swift
//  
//
//  Created by Phil Yates on 17/09/2021.
//

import UseCaseAbstraction
import Combine

enum LocationError: Error {
    case noLocation
}

struct MockLocationUseCaseError: GetCurrentLocationUseCase {
    let gpsLocation: GPSLocation?
    let error: Error?
    
    func invoke() -> AnyPublisher<GPSLocation, Error> {
        if let gpsLocation = gpsLocation {
            return Just<GPSLocation>(gpsLocation).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else if let error = error {
            return Fail<GPSLocation, Error>(error: error).eraseToAnyPublisher()
        }
        
        return Fail<GPSLocation, Error>(error: LocationError.noLocation).eraseToAnyPublisher()
    }
}
