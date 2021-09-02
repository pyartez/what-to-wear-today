//
//  File.swift
//  
//
//  Created by Phil Yates on 02/09/2021.
//

import Foundation
import Combine

protocol GetCurrentLocationUseCase {
    func invoke() -> AnyPublisher<GPSLocation, Error>
}
