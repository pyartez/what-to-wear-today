//
//  HourlyTimelineViewModel.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import Foundation

public struct HourlyTimelineViewModel {
    public let model: HourlyTimeItemViewModel
    public let separator: Bool
    
    public init(model: HourlyTimeItemViewModel, separator: Bool) {
        self.model = model
        self.separator = separator
    }
}
