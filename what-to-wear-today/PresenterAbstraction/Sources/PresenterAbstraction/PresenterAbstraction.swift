//
//  File.swift
//
//
//  Created by Phil Yates on 31/07/2021.
//
import Combine

public enum HomeScreenState {
    case loading
    case ready(HomeScreenViewModel)
    case error
}

public struct HomeScreenViewModel {
    public let title: String
    public let advicons: [AdviconListItem]
    public let hourlyTimeline: [HourlyTimelineViewModel]
    
    public init(title: String, advicons: [AdviconListItem], hourlyTimeline: [HourlyTimelineViewModel]) {
        self.title = title
        self.advicons = advicons
        self.hourlyTimeline = hourlyTimeline
    }
}

public protocol HomePresenter {
    var state: AnyPublisher<HomeScreenState, Error> { get }
    func load()
}
