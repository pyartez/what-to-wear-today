//
//  HomeScreenPresenter.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import SwiftUI
import Combine

public enum HomeScreenState {
    case loading
    case ready(HomeScreenViewModel)
    case error
}

public struct HomeScreenViewModel {
    let advicons: [AdviconListItem]
    let hourlyTimeline: [HourlyTimelineViewModel]
}

public class HomeScreenPresenter: ObservableObject {
    @Published var state: HomeScreenState = .loading
    
    private var cancellable: Cancellable?
    private let stateProvider: AnyPublisher<HomeScreenState, Error>
    
    public init(stateProvider: AnyPublisher<HomeScreenState, Error>) {
        self.stateProvider = stateProvider
    }
    
    public func start() {
        cancellable = stateProvider.sink(receiveCompletion: { [weak self] _ in
            self?.state = .error
        }, receiveValue: { [weak self] state in
            self?.state = state
        })
    }
}
