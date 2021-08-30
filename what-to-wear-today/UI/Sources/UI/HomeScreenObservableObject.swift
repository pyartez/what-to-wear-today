//
//  HomeScreenPresenter.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import SwiftUI
import Combine
import PresenterAbstraction

public class HomeScreenObservableObject: ObservableObject {
    @Published public var state: HomeScreenState = .loading
    
    private var cancellable: Cancellable?
    private let presenter: HomePresenter
    
    public init(presenter: HomePresenter) {
        self.presenter = presenter
        
        cancellable = presenter.state.sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .failure:
                self?.state = .error
            case .finished:
                break
            }
        }, receiveValue: { [weak self] state in
            self?.state = state
        })
    }
    
    public func start() {
        presenter.start()
    }
    
    public func stop() {
        cancellable?.cancel()
    }
}
